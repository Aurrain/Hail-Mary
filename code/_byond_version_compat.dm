/* To use the ref tracking debugging tool in game
1. Enable/uncomment the following before using debug tools on your local machine:

**TESTING
**REFERENCE_TRACKING
**REFERENCE_TRACKING_DEBUG
**GC_FAILURE_HARD_LOOKUP

2. Set return statement of the object you wish to ref track to
   QDEL_HINT_FINDREFERENCE or QDEL_HINT_IFFAIL_FINDREFERENCE

3. Start game up on your local machine and delete the object in question.
   Look at the daemon log for results.
*/

//#define TESTING
// By using the testing("message") proc you can create debug-feedback for people
// with this uncommented, but not visible in the release version

// Comment this out if you are debugging problems that might be obscured
// by custom error handling in world/Error
#ifdef DEBUG
#define USE_CUSTOM_ERROR_HANDLER
#endif

#ifdef TESTING

/// Used to find the sources of harddels
//#define REFERENCE_TRACKING
#ifdef REFERENCE_TRACKING

/// Used for doing dry runs of the reference finder
//#define REFERENCE_TRACKING_DEBUG

/// Run a lookup on things hard deleting by default
//#define GC_FAILURE_HARD_LOOKUP
#ifdef GC_FAILURE_HARD_LOOKUP
/// Don't stop when searching, go till you're totally done
#define FIND_REF_NO_CHECK_TICK
#endif // GC_FAILURE_HARD_LOOKUP

#endif // REFERENCE_TRACKING

//#define VISUALIZE_ACTIVE_TURFS

#endif // TESTING

//#define UNIT_TESTS

#ifndef PRELOAD_RSC
#define PRELOAD_RSC 2
// 0 = allow external/on-demand
// 1 = default
// 2 = preload everything
#endif

#ifdef LOWMEMORYMODE
#define FORCE_MAP "_maps/runtimestation.json"
#endif

// Minimum supported compiler
#define MIN_COMPILER_VERSION 513
#define MIN_COMPILER_BUILD 1514

#if (DM_VERSION < MIN_COMPILER_VERSION || DM_BUILD < MIN_COMPILER_BUILD) \
    && !defined(SPACEMAN_DMM) && !defined(OPENDREAM)
#error Your version of BYOND is too out-of-date to compile this project.
#error You need version 513.1514 or higher.
#endif

#ifdef TESTING
#warn compiling in TESTING mode. testing() debug messages will be visible.
#endif
#ifdef GC_FAILURE_HARD_LOOKUP
//#define FIND_REF_NO_CHECK_TICK
#endif

#ifdef CIBUILDING
#define UNIT_TESTS
#endif

#ifdef CITESTING
#define TESTING
#endif

#ifdef TGS
// TGS performs its own build of dm.exe
#define CBT
#endif

#ifdef CBT
#define ALL_MAPS
#endif

// Maximum overlays per atom
#define MAX_ATOM_OVERLAYS 100

#if !defined(CBT) && !defined(SPACEMAN_DMM)
#warn Building with Dream Maker is no longer supported and will result in errors.
#warn In order to build, run BUILD.bat in the root directory.
#warn Consider switching to VSCode editor instead (Ctrl+Shift+B).
#endif
