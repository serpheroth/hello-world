// Simple hello world demo
//
// Only prints the Git repository revision to cout.
//
#include <iostream>
using namespace std;

#include "buildtag.h"

int main()
{
	cout << "Hello world!" << endl;

	cout << "Build tag: " << BUILDTAG << endl;
	cout << "Git Repository Id: " << GITVERSION << endl;


	return 0;
}
