# qmake project include file for library dependencies

# The following part was inspired
# from http://stackoverflow.com/questions/2288292/qmake-project-dependencies-linked-libraries

# This function sets up the dependencies for libraries that are built with
# this project.  Specify the libraries you need to depend on in the variable
# DEPENDENCY_LIBRARIES and this will add.
for(dep, DEPENDENCY_LIBRARIES) {
    deplib = ../$${dep}/$${QMAKE_PREFIX_STATICLIB}$${dep}.$${QMAKE_EXTENSION_STATICLIB}
    LIBS += $$deplib
    PRE_TARGETDEPS += $$deplib
}
