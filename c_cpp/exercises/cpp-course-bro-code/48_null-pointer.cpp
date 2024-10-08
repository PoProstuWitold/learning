#include <iostream>

int main() {
	// Null value = a value that indicates that something has no value.
	//				When a pointer is holding a null value,
	// 				that pointer is not pointing at anything (null pointer).

	// nullptr = keyword that represents a null pointer literal
	// nullptrs are helpful when determining if an address
	// was successfully assigned to a pointer

	int *pAge = nullptr;
	int age = 21;
	pAge = &age;

	if (pAge == nullptr) {
		std::cout << "address was not assigned!\n";
	} else {
		std::cout << "address was assigned!\n";
		std::cout << *pAge;
	}

	return 0;
}