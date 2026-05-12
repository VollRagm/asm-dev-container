#include <iostream>
#include <string.h>

extern "C" int str_to_int(const char *str);

int main()
{

    std::cout << str_to_int("12345") << std::endl;
    return 0;
}
