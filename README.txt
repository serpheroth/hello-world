==============================================================================
Build Instructions
==============================================================================

Prerequisites:
""""""""""""""
- Qt:
  Qt is used to generate the platform specific build environment and for
  the platform independent GUI library (and other libraries).
  The code is tested with Qt 5.2 or later; earlier versions may work or not.
  Download it from http://qt-project.org

Preparations:
"""""""""""""
Generate your platform specific build environment using qmake started
from a command line prompt (bash on Linux / Mac OS X; cmd or PowerShell
or Cygwin on Windows):

  cd build
  qmake ../src/hello.pro

Building the hello world program:
"""""""""""""""""""""""""""""""""
  cd build
  make			# Windows with Qt MinGW: mingw32-make
  ./hello || release/hello

On Linux / Mac OS X, and also on Windows with Cygwin, you may use the
build scripts located in bin/share:
  bin/run-build.sh
