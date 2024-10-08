#include <iostream>

namespace first{
    int x = 1;
}

namespace second{
    int x = 2;
}

// BAD PRACTICE
// using namespace std;

int main() {
	// namespace - provides a way to avoid name collisions
	//             in large projects. Each entity needs a unique name.
	//             A namespace allows for identically named entities 
	//			   as long as they are in different namespaces.

	int x = 0;

	std::cout << x << '\n';
    std::cout << first::x << '\n';
    std::cout << second::x << '\n';

	return 0;
}