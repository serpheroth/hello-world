// Simple hello world demo
//
// Only prints build and revision number to cout.
//
#include <iostream>
using namespace std;

#include "app-lib/appVersion.h"

int main()
{
	cout << "Hello world!" << endl;

    cout << "Build tag: " << AppVersion::build() << endl;
    cout << "Git Repository Id: " << AppVersion::revision() << endl;

	return 0;
}
