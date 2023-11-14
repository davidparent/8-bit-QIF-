import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


segments = [ 63, 6, 91, 79, 102, 109, 125, 7, 127, 111 ]

@cocotb.test()
async def test_QIFNeuron(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 1, units="ms")
    cocotb.start_soon(clock.start())

    # reset the circuit
    dut.rst_n.value = 0
    # wait for 5 clock cycles
    await ClockCycles(dut.clk, 5)
    # take the design out of reset
    dut.rst_n.value = 1
   
    dut.ui_in.value = 4
    await ClockCycles(dut.clk, 50)
