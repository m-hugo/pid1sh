/* Copyright (C) 1991-2025 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */

/*
 *	ISO C99 Standard: 7.14 Signal handling <signal.h>
 */

#define _SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))
typedef struct
{
  unsigned long int __val[_SIGSET_NWORDS];
} __sigset_t;

typedef __sigset_t sigset_t;

#ifdef __USE_POSIX199309
union sigval
{
  int sival_int;
  void *sival_ptr;
};

typedef union sigval __sigval_t;
#else
union __sigval
{
  int __sival_int;
  void *__sival_ptr;
};

typedef union __sigval __sigval_t;
#endif

#define __SI_MAX_SIZE	128
#if __WORDSIZE == 64
# define __SI_PAD_SIZE	((__SI_MAX_SIZE / sizeof (int)) - 4)
#else
# define __SI_PAD_SIZE	((__SI_MAX_SIZE / sizeof (int)) - 3)
#endif

#ifndef __SI_ALIGNMENT
# define __SI_ALIGNMENT		/* nothing */
#endif
#ifndef __SI_BAND_TYPE
# define __SI_BAND_TYPE		long int
#endif
#ifndef __SI_CLOCK_T
# define __SI_CLOCK_T		__clock_t
#endif
#ifndef __SI_ERRNO_THEN_CODE
# define __SI_ERRNO_THEN_CODE	1
#endif
#ifndef __SI_HAVE_SIGSYS
# define __SI_HAVE_SIGSYS	1
#endif
#ifndef __SI_SIGFAULT_ADDL
# define __SI_SIGFAULT_ADDL	/* nothing */
#endif

typedef struct
  {
    int si_signo;		/* Signal number.  */
#if __SI_ERRNO_THEN_CODE
    int si_errno;		/* If non-zero, an errno value associated with
				   this signal, as defined in <errno.h>.  */
    int si_code;		/* Signal code.  */
#else
    int si_code;
    int si_errno;
#endif
#if __WORDSIZE == 64
    int __pad0;			/* Explicit padding.  */
#endif

    union
      {
	int _pad[__SI_PAD_SIZE];

	 /* kill().  */
	struct
	  {
	    __pid_t si_pid;	/* Sending process ID.  */
	    __uid_t si_uid;	/* Real user ID of sending process.  */
	  } _kill;

	/* POSIX.1b timers.  */
	struct
	  {
	    int si_tid;		/* Timer ID.  */
	    int si_overrun;	/* Overrun count.  */
	    __sigval_t si_sigval;	/* Signal value.  */
	  } _timer;

	/* POSIX.1b signals.  */
	struct
	  {
	    __pid_t si_pid;	/* Sending process ID.  */
	    __uid_t si_uid;	/* Real user ID of sending process.  */
	    __sigval_t si_sigval;	/* Signal value.  */
	  } _rt;

	/* SIGCHLD.  */
	struct
	  {
	    __pid_t si_pid;	/* Which child.	 */
	    __uid_t si_uid;	/* Real user ID of sending process.  */
	    int si_status;	/* Exit value or signal.  */
	    __SI_CLOCK_T si_utime;
	    __SI_CLOCK_T si_stime;
	  } _sigchld;

	/* SIGILL, SIGFPE, SIGSEGV, SIGBUS.  */
	struct
	  {
	    void *si_addr;	    /* Faulting insn/memory ref.  */
	    __SI_SIGFAULT_ADDL
	    short int si_addr_lsb;  /* Valid LSB of the reported address.  */
	    union
	      {
		/* used when si_code=SEGV_BNDERR */
		struct
		  {
		    void *_lower;
		    void *_upper;
		  } _addr_bnd;
		/* used when si_code=SEGV_PKUERR */
		__uint32_t _pkey;
	      } _bounds;
	  } _sigfault;

	/* SIGPOLL.  */
	struct
	  {
	    __SI_BAND_TYPE si_band;	/* Band event for SIGPOLL.  */
	    int si_fd;
	  } _sigpoll;

	/* SIGSYS.  */
#if __SI_HAVE_SIGSYS
	struct
	  {
	    void *_call_addr;	/* Calling user insn.  */
	    int _syscall;	/* Triggering system call number.  */
	    unsigned int _arch; /* AUDIT_ARCH_* of syscall.  */
	  } _sigsys;
#endif
      } _sifields;
  } siginfo_t __SI_ALIGNMENT;


#define	SIG_ERR	 ((__sighandler_t) -1)	/* Error return.  */
#define	SIG_DFL	 ((__sighandler_t)  0)	/* Default action.  */
#define	SIG_IGN	 ((__sighandler_t)  1)	/* Ignore signal.  */

#ifdef __USE_XOPEN
# define SIG_HOLD ((__sighandler_t) 2)	/* Add signal to hold mask.  */
#endif

/* We define here all the signal names listed in POSIX (1003.1-2008);
   as of 1003.1-2013, no additional signals have been added by POSIX.
   We also define here signal names that historically exist in every
   real-world POSIX variant (e.g. SIGWINCH).

   Signals in the 1-15 range are defined with their historical numbers.
   For other signals, we use the BSD numbers.
   There are two unallocated signal numbers in the 1-31 range: 7 and 29.
   Signal number 0 is reserved for use as kill(pid, 0), to test whether
   a process exists without sending it a signal.  */

/* ISO C99 signals.  */
#define	SIGINT		2	/* Interactive attention signal.  */
#define	SIGILL		4	/* Illegal instruction.  */
#define	SIGABRT		6	/* Abnormal termination.  */
#define	SIGFPE		8	/* Erroneous arithmetic operation.  */
#define	SIGSEGV		11	/* Invalid access to storage.  */
#define	SIGTERM		15	/* Termination request.  */

/* Historical signals specified by POSIX. */
#define	SIGHUP		1	/* Hangup.  */
#define	SIGQUIT		3	/* Quit.  */
#define	SIGTRAP		5	/* Trace/breakpoint trap.  */
#define	SIGKILL		9	/* Killed.  */
#define	SIGPIPE		13	/* Broken pipe.  */
#define	SIGALRM		14	/* Alarm clock.  */

/* Archaic names for compatibility.  */
#define	SIGIO		SIGPOLL	/* I/O now possible (4.2 BSD).  */
#define	SIGIOT		SIGABRT	/* IOT instruction, abort() on a PDP-11.  */
#define	SIGCLD		SIGCHLD	/* Old System V name */

/* Not all systems support real-time signals.  bits/signum.h indicates
   that they are supported by overriding __SIGRTMAX to a value greater
   than __SIGRTMIN.  These constants give the kernel-level hard limits,
   but some real-time signals may be used internally by glibc.  Do not
   use these constants in application code; use SIGRTMIN and SIGRTMAX
   (defined in signal.h) instead.  */

#define SIGSTKFLT	16	/* Stack fault (obsolete).  */
#define SIGPWR		30	/* Power failure imminent.  */

/* Historical signals specified by POSIX. */
#define SIGBUS		 7	/* Bus error.  */
#define SIGSYS		31	/* Bad system call.  */

/* New(er) POSIX signals (1003.1-2008, 1003.1-2013).  */
#define SIGURG		23	/* Urgent data is available at a socket.  */
#define SIGSTOP		19	/* Stop, unblockable.  */
#define SIGTSTP		20	/* Keyboard stop.  */
#define SIGCONT		18	/* Continue.  */
#define SIGCHLD		17	/* Child terminated or stopped.  */
#define SIGTTIN		21	/* Background read from control terminal.  */
#define SIGTTOU		22	/* Background write to control terminal.  */
#define SIGPOLL		29	/* Pollable event occurred (System V).  */
#define SIGXFSZ		25	/* File size limit exceeded.  */
#define SIGXCPU		24	/* CPU time limit exceeded.  */
#define SIGVTALRM	26	/* Virtual timer expired.  */
#define SIGPROF		27	/* Profiling timer expired.  */
#define SIGUSR1		10	/* User-defined signal 1.  */
#define SIGUSR2		12	/* User-defined signal 2.  */

/* Nonstandard signals found in all modern POSIX systems
   (including both BSD and Linux).  */
#define SIGWINCH	28	/* Window size change (4.3 BSD, Sun).  */

/* Archaic names for compatibility.  */
#define SIGIO		SIGPOLL	/* I/O now possible (4.2 BSD).  */
#define SIGIOT		SIGABRT	/* IOT instruction, abort() on a PDP-11.  */
#define SIGCLD		SIGCHLD	/* Old System V name */

#define __SIGRTMIN	32
#define __SIGRTMAX	64

/* Biggest signal number + 1 (including real-time signals).  */
#define _NSIG		(__SIGRTMAX + 1)



typedef __pid_t pid_t;
/* Type of a signal handler.  */
typedef void (*__sighandler_t) (int);
typedef __sighandler_t sighandler_t;


/* Structure describing the action to be taken when a signal arrives.  */
struct sigaction
  {
    /* Signal handler.  */
#if defined __USE_POSIX199309 || defined __USE_XOPEN_EXTENDED
    union
      {
	/* Used if SA_SIGINFO is not set.  */
	__sighandler_t sa_handler;
	/* Used if SA_SIGINFO is set.  */
	void (*sa_sigaction) (int, siginfo_t *, void *);
      }
    __sigaction_handler;
# define sa_handler	__sigaction_handler.sa_handler
# define sa_sigaction	__sigaction_handler.sa_sigaction
#else
    __sighandler_t sa_handler;
#endif

    /* Additional set of signals to be blocked.  */
    __sigset_t sa_mask;

    /* Special flags.  */
    int sa_flags;

    /* Restore handler.  */
    void (*sa_restorer) (void);
  };

/* Bits in `sa_flags'.  */
#define	SA_NOCLDSTOP  1		 /* Don't send SIGCHLD when children stop.  */
#define SA_NOCLDWAIT  2		 /* Don't create zombie on child death.  */
#define SA_SIGINFO    4		 /* Invoke signal-catching function with
				    three arguments instead of one.  */
#if defined __USE_XOPEN_EXTENDED || defined __USE_MISC
# define SA_ONSTACK   0x08000000 /* Use signal stack by using `sa_restorer'. */
#endif
#if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8
# define SA_RESTART   0x10000000 /* Restart syscall on signal return.  */
# define SA_NODEFER   0x40000000 /* Don't automatically block the signal when
				    its handler is being executed.  */
# define SA_RESETHAND 0x80000000 /* Reset to SIG_DFL on entry to handler.  */
#endif
#ifdef __USE_MISC
# define SA_INTERRUPT 0x20000000 /* Historical no-op.  */

/* Some aliases for the SA_ constants.  */
# define SA_NOMASK    SA_NODEFER
# define SA_ONESHOT   SA_RESETHAND
# define SA_STACK     SA_ONSTACK
#endif

/* Values for the HOW argument to `sigprocmask'.  */
#define	SIG_BLOCK     0		 /* Block signals.  */
#define	SIG_UNBLOCK   1		 /* Unblock signals.  */
#define	SIG_SETMASK   2		 /* Set the set of blocked signals.  */


#ifdef __USE_POSIX

/* Clear all signals from SET.  */
extern int sigemptyset (sigset_t *__set) __THROW __nonnull ((1));

/* Set all signals in SET.  */
extern int sigfillset (sigset_t *__set) __THROW __nonnull ((1));

/* Add SIGNO to SET.  */
extern int sigaddset (sigset_t *__set, int __signo) __THROW __nonnull ((1));

/* Remove SIGNO from SET.  */
extern int sigdelset (sigset_t *__set, int __signo) __THROW __nonnull ((1));

/* Return 1 if SIGNO is in SET, 0 if not.  */
extern int sigismember (const sigset_t *__set, int __signo)
     __THROW __nonnull ((1));

# ifdef __USE_GNU
/* Return non-empty value is SET is not empty.  */
extern int sigisemptyset (const sigset_t *__set) __THROW __nonnull ((1));

/* Build new signal set by combining the two inputs set using logical AND.  */
extern int sigandset (sigset_t *__set, const sigset_t *__left,
		      const sigset_t *__right) __THROW __nonnull ((1, 2, 3));

/* Build new signal set by combining the two inputs set using logical OR.  */
extern int sigorset (sigset_t *__set, const sigset_t *__left,
		     const sigset_t *__right) __THROW __nonnull ((1, 2, 3));
# endif /* GNU */

/* Get and/or change the set of blocked signals.  */
extern int sigprocmask (int __how, const sigset_t *__restrict __set,
			sigset_t *__restrict __oset) __THROW;

# ifdef __USE_POSIX199506
/* Select any of pending signals from SET or wait for any to arrive.

   This function is a cancellation point and therefore not marked with
   __THROW.  */
extern int sigwait (const sigset_t *__restrict __set, int *__restrict __sig)
     __nonnull ((1, 2));
# endif /* Use POSIX 1995.  */

# ifdef __USE_POSIX199309
/* Select any of pending signals from SET and place information in INFO.

   This function is a cancellation point and therefore not marked with
   __THROW.  */
extern int sigwaitinfo (const sigset_t *__restrict __set,
			siginfo_t *__restrict __info) __nonnull ((1));


/* Send signal SIG to the process PID.  Associate data in VAL with the
   signal.  */
extern int sigqueue (__pid_t __pid, int __sig, const union sigval __val)
     __THROW;
# endif	/* Use POSIX 199306.  */

#endif /* Use POSIX.  */


/* The following functions are used internally in the C library and in
   other code which need deep insights.  */

/* Return number of available real-time signal with highest priority.  */
extern int __libc_current_sigrtmin (void) __THROW;
/* Return number of available real-time signal with lowest priority.  */
extern int __libc_current_sigrtmax (void) __THROW;

#define SIGRTMIN        (__libc_current_sigrtmin ())
#define SIGRTMAX        (__libc_current_sigrtmax ())



/* 1 if 'type' is a pointer type, 0 otherwise.  */
# define __pointer_type(type) (__builtin_classify_type ((type) 0) == 5)

/* intptr_t if P is true, or T if P is false.  */
# define __integer_if_pointer_type_sub(T, P) \
  __typeof__ (*(0 ? (__typeof__ (0 ? (T *) 0 : (void *) (P))) 0 \
		  : (__typeof__ (0 ? (intptr_t *) 0 : (void *) (!(P)))) 0))

/* intptr_t if EXPR has a pointer type, or the type of EXPR otherwise.  */
# define __integer_if_pointer_type(expr) \
  __integer_if_pointer_type_sub(__typeof__ ((__typeof__ (expr)) 0), \
				__pointer_type (__typeof__ (expr)))

/* Cast an integer or a pointer VAL to integer with proper type.  */
# define cast_to_integer(val) ((__integer_if_pointer_type (val)) (val))

/* Cast an integer VAL to void * pointer.  */
# define cast_to_pointer(val) ((void *) (uintptr_t) (val))

/* Align a value by rounding down to closest size.
   e.g. Using size of 4096, we get this behavior:
	{4095, 4096, 4097} = {0, 4096, 4096}.  */
#define ALIGN_DOWN(base, size)	((base) & -((__typeof__ (base)) (size)))

/* Align a value by rounding up to closest size.
   e.g. Using size of 4096, we get this behavior:
	{4095, 4096, 4097} = {4096, 4096, 8192}.

  Note: The size argument has side effects (expanded multiple times).  */
#define ALIGN_UP(base, size)	ALIGN_DOWN ((base) + (size) - 1, (size))

/* Same as ALIGN_DOWN(), but automatically casts when base is a pointer.  */
#define PTR_ALIGN_DOWN(base, size) \
  ((__typeof__ (base)) ALIGN_DOWN ((uintptr_t) (base), (size)))

/* Same as ALIGN_UP(), but automatically casts when base is a pointer.  */
#define PTR_ALIGN_UP(base, size) \
  ((__typeof__ (base)) ALIGN_UP ((uintptr_t) (base), (size)))

/* Check if BASE is aligned on SIZE  */
#define PTR_IS_ALIGNED(base, size) \
  ((((uintptr_t) (base)) & (size - 1)) == 0)

/* Returns the ptrdiff_t difference between P1 and P2.  */
#define PTR_DIFF(p1, p2) \
  ((ptrdiff_t)((uintptr_t)(p1) - (uintptr_t)(p2)))



#ifndef ULONG_WIDTH
#define ULONG_WIDTH __WORDSIZE
#endif

#define __sigmask(sig) \
  (1UL << (((sig) - 1) % ULONG_WIDTH))

/* Return the word index for SIG.  */
static inline int
__sigword (int sig)
{
  return (sig - 1) / ULONG_WIDTH;
}

/* Linux sig* functions only handle up to __NSIG_WORDS words instead of
   full _SIGSET_NWORDS sigset size.  The signal numbers are 1-based, and
   bit 0 of a signal mask is for signal 1.  */
#define __NSIG_WORDS (ALIGN_UP ((_NSIG - 1), ULONG_WIDTH) / ULONG_WIDTH)
_Static_assert (__NSIG_WORDS <= _SIGSET_NWORDS,
		"__NSIG_WORDS > _SIGSET_WORDS");

/* This macro is used on syscall that takes a sigset_t to specify the expected
   size in bytes.  As for glibc, kernel sigset is implemented as an array of
   unsigned long.  */
#define __NSIG_BYTES (__NSIG_WORDS * (ULONG_WIDTH / UCHAR_WIDTH))

static inline void
__sigemptyset (sigset_t *set)
{
  int cnt = __NSIG_WORDS;
  while (--cnt >= 0)
   set->__val[cnt] = 0;
}

static inline void
__sigfillset (sigset_t *set)
{
  int cnt = __NSIG_WORDS;
  while (--cnt >= 0)
   set->__val[cnt] = ~0UL;
}

static inline int
__sigisemptyset (const sigset_t *set)
{
  int cnt = __NSIG_WORDS;
  unsigned long int ret = set->__val[--cnt];
  while (ret == 0 && --cnt >= 0)
    ret = set->__val[cnt];
  return ret == 0;
}

static inline void
__sigandset (sigset_t *dest, const sigset_t *left, const sigset_t *right)
{
  int cnt = __NSIG_WORDS;
  while (--cnt >= 0)
    dest->__val[cnt] = left->__val[cnt] & right->__val[cnt];
}

static inline void
__sigorset (sigset_t *dest, const sigset_t *left, const sigset_t *right)
{
  int cnt = __NSIG_WORDS;
  while (--cnt >= 0)
    dest->__val[cnt] = left->__val[cnt] | right->__val[cnt];
}

static inline int
__sigismember (const sigset_t *set, int sig)
{
  unsigned long int mask = __sigmask (sig);
  int word = __sigword (sig);
  return set->__val[word] & mask ? 1 : 0;
}

static inline void
__sigaddset (sigset_t *set, int sig)
{
  unsigned long int mask = __sigmask (sig);
  int word = __sigword (sig);
  set->__val[word] |= mask;
}

static inline void
__sigdelset (sigset_t *set, int sig)
{
  unsigned long int mask = __sigmask (sig);
  int word = __sigword (sig);
  set->__val[word] &= ~mask;
}
