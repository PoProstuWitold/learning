#include <iostream>
#include <boost/multiprecision/cpp_int.hpp>

int main() {
	long long num1 = 1523844560192817464;
	long long num2= 598274671729184766;
	boost::multiprecision::int128_t result = (boost::multiprecision::int128_t) num1 * num2;
	std::cout << "The product of the two integers is:" << "\n" << result;
	return 0;
}