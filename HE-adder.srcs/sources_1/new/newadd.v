`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 10:09:14 PM
// Design Name: 
// Module Name: newadd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module newadd;
  reg clk; // Define a clock signal
  reg a0, a1, b0, b1;
  reg [3:0] r1, r2, r3, r4;
  reg [14:0] q1, q2, q3, q4, p;
  reg [14:0] c1, c2, c3, c4;
  reg [14:0] z0_add, z0_carry;
  reg [14:0] z1_add, z1_carry;
  reg [14:0] z0, z1, z2;

  // Define clock parameters
  // Adjust this value as needed for your desired clock frequency

  // Clock generation
  always begin
    #5 clk = ~clk; // Create a simple clock signal with a 5 time unit period (adjust as needed)
  end// Create a clock signal with a period of CLOCK_PERIOD
 
  always @(posedge clk) begin
    // Your code for the calculations
    a0 = 1;
    a1 = 1;
    b0 = 0;
    b1 = 0;
    r1 = ($urandom % 10) + 1;
    r2 = $urandom % 10 + 1;
    r3 = $urandom % 10 + 1;
    r4 = $urandom % 10 + 1;
    q1 = $urandom % 10001 + 10000;
    q2 = $urandom % 10001 + 10000;
    q3 = $urandom % 10001 + 10000;
    q4 = $urandom % 10001 + 10000;
    p = $urandom % 10001 + 10000;
    c1 = (q1 * p) + (2 * r1) + a0;
    c2 = (q2 * p) + (2 * r2) + a1;
    c3 = (q3 * p) + (2 * r3) + b0;
    c4 = (q4 * p) + (2 * r4) + b1;
    z0_add = c1 + c3;
    z0_carry = c1 * c3;
    z1_add = c2 + c4 + z0_carry;
    z1_carry = (c2 * c4) + (c2 * z0_carry) + (c4 * z0_carry);
    z0 = (z0_add % p) % 2;
    z1 = (z1_add % p) % 2;
    z2 = (z1_carry % p) % 2;

    // Display the results (optional)
    $display("r1 = %d, r2 = %d, r3 = %d, r4 = %d", r1, r2, r3, r4);
    $display("q1 = %d, q2 = %d, q3 = %d, q4 = %d", q1, q2, q3, q4);
    $display("a0 = %d, a1 = %d, b0 = %d, b1 = %d", a0, a1, b0, b1);
    $display("p = %d", p);
    $display("c1 = %d", c1);
    $display("c2 = %d", c2);
    $display("c3 = %d", c3);
    $display("c4 = %d", c4);
    $display("z0_add = %d", z0_add);
    $display("z0_carry = %d", z0_carry);
    $display("z1_add = %d", z1_add);
    $display("z1_carry = %d", z1_carry);
    $display("z0 = %d", z0);
    $display("z1 = %d", z1);
    $display("z2 = %d", z2);
    $display("z2 = %d, z1 = %d, z0 = %d", z2, z1, z0);
  end
endmodule
