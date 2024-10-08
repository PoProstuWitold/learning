#include <iostream>

// cout << (insertion operator)
// cin >> (extraction operator)

int main() {
	std::string name;
   	int age;
	std::cout << "What's your full name?: ";

	// can take line with spaces
	std::getline(std::cin >> std::ws, name);
	std::cout << "What's your age?: ";
	std::cin >> age;
	std::cout << "Hello " << name << '\n';
	std::cout << "You are " << age << " years old";

	return 0;
}