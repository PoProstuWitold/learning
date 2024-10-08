#include <iostream>

// struct - a structure that groups related variables under one name.
// Can contain many different data types.
// Variables in a struct are called "members".
// Members can be accessed using the member access operator (.).

struct student {
	std::string name;
	double gpa;
	bool enrolled = true;
} typedef student;

int main() {
	student student1;
	student1.name = "Spongebob";
	student1.gpa = 3.2;

	student student2;
	student2.name = "Patrick";
	student2.gpa = 2.1;

	student student3;
	student3.name = "Squidward";
	student3.gpa = 1.5;

	std::cout << student1.name << '\n';
	std::cout << student1.gpa << '\n';
	std::cout << student1.enrolled << '\n';
	std::cout << student2.name << '\n';
	std::cout << student2.gpa << '\n';
	std::cout << student2.enrolled << '\n';
	std::cout << student3.name << '\n';
	std::cout << student3.gpa << '\n';
	std::cout << student3.enrolled << '\n';

	return 0;
}