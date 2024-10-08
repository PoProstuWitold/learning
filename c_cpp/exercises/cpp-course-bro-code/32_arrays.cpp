#include <iostream>

int main() {
	std::string cars[3] = {"Peugeot", "Audi", "Suzuki"};

	for(const auto& car : cars) {
		std::cout << car << '\n';
	}

	return 0;
}