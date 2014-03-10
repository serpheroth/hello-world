hello-world
===========

A "Hello World" example in C++ with `qmake` and the `qttest` unit test framework.

The purpose of this project is to provide an example of
 * a build environment with `qmake`, where source code is arranged into several directories / libraries
 * an integration of the unit test build into the multi-directory source tree
which may be used as a starting point for a C++ project using Qt.

## Prerequisites ##
Before you can build the project, you have to provide
 * Qt
 * Bash

Of course, you also need a C++ compiler, but that shouldn't be a problem. All prerequesites are available as Open Source projects.

### Qt Framework ###
This Hello World project uses [Qt's](http://qt-project.org) `qmake` build environment which is used to generate the platform specific build environment. Beside `qmake`, the qttestlib is used to demonstrate building a unit test application.

The code is tested with Qt 5.2.1 which you can download from http://qt-project.org. Other Qt versions may work or not.

The build environment was tested with the following development environments:
 * Ubuntu GNU/Linux 12.04 (64 bit), i.e. g++ 4.6.4
 * Windows 8.1 with MinGW as contained in the Qt installation


### Bash ###
A bash script is used to generate a header file containing the current SCM revision number. On Unix like systems (Linux, MacOS X), this is not a problem; on Windows you have to take care that a bash executable can be found via the Path environment variable, e.g. from a [Cygwin](http://cygwin.com) environment.

## Build Instructions ##
As usual with `qmake`, the project is prepared to be built in a separate build directory. You may use any directory, but our recommendation is to use the `build` subdirectory which is already present in the repository. It contains a `.gitgnore` file telling `git` to ignore all files in this directory; actually, all files there are generated by the compiler, so nothing built here should be added to the repository.

### Building from the command line ###
There is a small bash script available to run a simple build. Using the Unix terminal, or e.g. Cygwin on Windows, just `cd` to the repository root directory and execute `bin/run-build.sh`. This will create
 * `build/hello` (`hello.exe` on Windows), the "application" program; just run it to see the version output.
 * `build/unit-test` (`unit-test.exe` on Windows), the unit test binary; just run it to see the tests pass.

You may simply clean the `build` directory by e.g. `rm -r build/*` (be sure you know what you are doing ... removing files with the `*` wildcard always contains some risks in case of input errors ...).

### Building from the IDE ###
Even simpler than building from the command line is using the `QtCreator` integrated development environment, which is contained in the Qt installation. Usually, QtCreator configures a "Debug" and a "Release" build in different build directories. Instead of using the default directories, you may change both to live inside the `build` subdirectory - but that's up to your choice.

To build, you can easily use the menus resp. the command buttions of QtCreator.
