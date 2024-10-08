#include <iostream>

int main() {

    //int (whole number)
    int age = 21;
    int year = 2024;

    //double (number including decimal)
    double price = 10.99;
    double temperature = 25.1;

    //char (single character)
    char initial = 'W';
    char currency = '$';

    //boolean (true or false)
    bool student = false;
    bool power = true;

    //string (objects that represent a sequence of text)
    std::string name = "Witold";
    std::string day = "Friday";
    std::string food = "kebab";

    std::cout << "Hello " << name << '\n';
    std::cout << "You are " << age << " years old" << '\n';

    return 0;
}