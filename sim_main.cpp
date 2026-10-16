#include <verilated.h>
#include "Vvga_controller.h"

int main(int argc, char** argv)
{
    Verilated::commandArgs(argc, argv);

    Vvga_controller* top = new Vvga_controller;

    top->clk = 0;
    top->rst = 1;

    // Reset
    for(int i=0;i<10;i++)
    {
        top->clk ^= 1;
        top->eval();
    }

    top->rst = 0;

    // Run simulation
    for(int i=0;i<5000;i++)
    {
        top->clk = 0;
        top->eval();

        top->clk = 1;
        top->eval();
    }

    delete top;
}

double sc_time_stamp() {
    return 0;
}