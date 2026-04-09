#include <iostream>
#include <string.h>

extern "C" int asm_add(int a, int b);

int main()
{
    int result = asm_add(10, 59);
    std::cout << "Addition result: " << result << std::endl;
    return 0;
}