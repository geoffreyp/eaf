#ifndef   	LIBMISC_COMMON_H_
# define   	LIBMISC_COMMON_H_

#ifdef R_PACKAGE
#include <R.h>
#define eaf_assert(EXP)                                                       \
    do { if (!(EXP)) { error("eaf package: error: assertion failed: '%s'",    \
                             #EXP);}} while(0)
#define fatal_error(...) Rf_error(__VA_ARGS__)
#define errprintf error
#define warnprintf warning
#include "gcc_attribs.h"
#else
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include "gcc_attribs.h"
#include <assert.h>
#define eaf_assert(X) assert(X)
void fatal_error(const char * format,...) __attribute__ ((format(printf, 1, 2))) __noreturn __unused;
void errprintf(const char * format,...) __attribute__ ((format(printf, 1, 2)));
void warnprintf(const char *format,...)  __attribute__ ((format(printf, 1, 2)));
#endif

#if __GNUC__ >= 3
#define MAX(x,y) __extension__                       \
    ({ typeof (x) _x__ = (x);                        \
        typeof (y) _y__ = (y);                       \
        _x__ > _y__ ? _x__ : _y__; })
#define MIN(x,y) __extension__          \
    ({ typeof (x) _x__ = (x);           \
        typeof (y) _y__ = (y);          \
        _x__ < _y__ ? _x__ : _y__; })
#endif


#define DEBUG_DO(X)     do{ X;} while(0)
#define DEBUG_NOT_DO(X) while(0){ X;}

#if DEBUG >= 1
#define DEBUG1(X) DEBUG_DO(X)
#else  
#define DEBUG1(X) DEBUG_NOT_DO(X)
#endif

#if DEBUG >= 2
#define DEBUG2(X) DEBUG_DO(X)
#else  
#define DEBUG2(X) DEBUG_NOT_DO(X)
#endif

#if DEBUG >= 3
#define DEBUG3(X) DEBUG_DO(X)
#else  
#define DEBUG3(X) DEBUG_NOT_DO(X)
#endif

#if DEBUG >= 4
#define DEBUG4(X) DEBUG_DO(X)
#else  
#define DEBUG4(X) DEBUG_NOT_DO(X)
#endif

#ifndef R_PACKAGE
#define DEBUG2_PRINT(...) DEBUG2 (fprintf (stderr, __VA_ARGS__))

#define DEBUG2_FUNPRINT(...) \
    do { DEBUG2_PRINT ("%s(): ", __FUNCTION__); \
         DEBUG2_PRINT (__VA_ARGS__); } while(0)
#endif

/* This is deprecated. See https://www.gnu.org/software/libc/manual/html_node/Heap-Consistency-Checking.html
#if DEBUG >= 1
#ifndef MALLOC_CHECK_
#define MALLOC_CHECK_ 3
#endif
#endif
*/
#include <stdbool.h>
#define TRUE  true
#define FALSE false

#ifndef ignore_unused_result
#define ignore_unused_result(X)  do { if(X) {}} while(0);
#endif

typedef unsigned long ulong;
typedef long long longlong;

static inline const char *str_is_default(bool flag)
{
    return flag ? "(default)" : "";
}

#endif 	    /* !LIBMISC_COMMON_H_ */
