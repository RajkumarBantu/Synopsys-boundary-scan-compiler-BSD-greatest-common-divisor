`timescale 1 ns / 10 ps

module flush_tb();
    reg RST, CLK, GO_I, TEST_SI, TEST_SE, TCK, TRSTN, TDI, TMS;
    reg[3:0] X_I, Y_I;
    wire[3:0] D_O;
    wire TDO, TEST_SO;

    TOP uut(.RST(RST), .CLK(RST), .GO_I(GO_I), .X_I(X_I), .Y_I(Y_I), .D_O(D_O), .TEST_SI(TEST_SI), .TEST_SO(TEST_SO), .TEST_SE(TEST_SE), .TCK(TCK), .TRSTN(TRSTN), .TDI(TDI), .TMS(TMS), .TDO(TDO));

    parameter t = 40;
    
    initial begin
        TCK = 0;
    end

    always #(t/2) TCK = ~TCK;
    
    always @(negedge TCK) begin
        // Core circuit initialization
        RST = 1;
        CLK = 0;
        GO_I = 0; 
        TEST_SI = 0; 
        TEST_SE = 0;
        X_I = 0;
        Y_I = 0;
        
        // TAP initialization
        TRSTN = 0;
        TDI = 0;
        TMS = 0;
        
        // Deactivate resets
        #(5*t)
        RST = 0;
        TRSTN = 1;
        #(5*t)

        // Drive to Shift IR 
        TMS = 1; #t  // Select DR
        TMS = 1; #t  // Select IR
        TMS = 0; #t  // Capture IR
        TMS = 0; #t  // Shift IR
        
        // Input SCANCH (1101) LSB first
        TDI = 1; #(t)
        TDI = 0; #(t)
        TDI = 1; #(t)
        TDI = 1; TMS = 1; #(t) // Exit-1 IR
        TDI = 0;
        
        // Drive to Shift DR
        TMS = 1; #(t) // Update IR
        TMS = 1; #(t) // Select DR
        TMS = 0; #(t) // Capture DR
        TMS = 0; #(t) // Shift DR
        
        // Input Flush Test (11001)
        TDI = 1; #(t)
        TDI = 0; #(t)
        TDI = 0; #(t)
        TDI = 1; #(t)
        TDI = 1; #(t)
        
        // Wait for Flush to Clear
        TDI = 0; #(45*p)
        
        $display("Simulation Complete");
        $stop;
    end
    
endmodule
