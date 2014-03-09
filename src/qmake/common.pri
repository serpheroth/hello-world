# qmake project include file with common settings

DESTDIR = ../../build                   # target directory
#CONFIG += debug
# Note: Setting 'silent' currently leads to linker problems with mingw32!?
#CONFIG += silent        # remove this to see full compiler call
#CONFIG += c++11

#win32: SONAME=dll
#else:  SONAME=so
#win32-msvc* {    # file name of library foo is foo.lib
#    OBJEXT=obj
#}
#else {    # file name of library foo is libfoo.a
#    OBJEXT=o
#}

*-g++ {
    # -Wall / -Wextra are enabled by default (at least for config win32-g++)
    QMAKE_CXXFLAGS += \
        -Werror \
        -Wdeprecated \

}

INCLUDEPATH += \
    .. \                # to allow #include "app-lib/someHeader.h"
    $$DESTDIR
