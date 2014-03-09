# qmake project include for generating version header file
#
# NOTE: The generation depends on 'bash', so be sure on Windows to
# have it in PATH, e.g. add the cygwin direcotory to the environment
# variable 'Path'

#
# NOTE: All paths are relative to the including project file!

# we will generate a header file in $$OUT_PWD, so include it in search paths
INCLUDEPATH += $$OUT_PWD
DEPENDPATH += $$OUT_PWD

# magically create version.h with subversion number
version.target = $$OUT_PWD/buildtag.h
version.commands = @bash -c \'mkdir -p \"$$OUT_PWD\"; bash \"$$_PRO_FILE_PWD_/../../bin/create-buildtag.sh\" \"$$version.target\"\'
version.depends = checkalways	# ensure this is always made

# the target 'checkalways' just prints a build info
checkalways.commands = @bash -c \'echo -n \"checking revision number ... \"\'

QMAKE_EXTRA_TARGETS += version checkalways
PRE_TARGETDEPS += $$version.target
QMAKE_DISTCLEAN += $$version.target

OTHER_FILES += ../bin/create-buildtag.sh

# see http://colby.id.au/pre-pre-build-commands-with-qmake
# This tricky part makes the Makefile.* depend on the version target,
# but without rule -> just an additional dependency, and the version
# will be generated *before* working on Makefile.*
versionbuildhook.depends = version
CONFIG(debug,debug|release):versionbuildhook.target = Makefile.Debug
CONFIG(release,debug|release):versionbuildhook.target = Makefile.Release
QMAKE_EXTRA_TARGETS += versionbuildhook
