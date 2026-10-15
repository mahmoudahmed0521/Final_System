module Data_sync #(parameter BUS_WIDTH = 8,
                            NUM_STAGES = 2 )
                  (
    input   wire  [BUS_WIDTH-1 : 0]   Unsync_bus ,
    input   wire                      bus_enable ,
    input   wire                      CLK ,
    input   wire                      RST ,   

    output  reg   [BUS_WIDTH-1 : 0]   sync_bus ,
    output  reg                       enable_pulse


);
// Internal Registers
(* ASYNC_REG = "TRUE" *)
    reg [NUM_STAGES-1:0] sync_reg;
    reg                  pulse_gen_ff;
    wire                 generated_pulse;
    

    // assign statement for the mux sel
    assign generated_pulse = (  (~pulse_gen_ff) && sync_reg[0] );

    //   1st always block for multi stage sync
    always@(posedge CLK or negedge RST)
    begin
        if(!RST)  sync_reg <= 'b0;
        else begin
            sync_reg <= {bus_enable, sync_reg[NUM_STAGES-1:1]};
        end
    end

    /// 2nd always block for pulse gen
     always@(posedge CLK or negedge RST)
    begin
        if(!RST) begin
            pulse_gen_ff <= 1'b0;
            enable_pulse <= 1'b0;

        end 
        else begin
            pulse_gen_ff <= sync_reg[0] ;
            enable_pulse <= generated_pulse;
        end
    end   



    // always block for the mux and sync_bus
    always @( posedge CLK or negedge RST)
     begin
        if(! RST ) begin
            sync_bus <= 'b0;
        end
        
        else if(generated_pulse) begin
            sync_bus <=     Unsync_bus;
        end
     end


endmodule
