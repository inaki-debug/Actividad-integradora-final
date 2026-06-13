module tb_sequence_detector();

//señales de entrada
reg clk, reset, sequence_in;
wire match_sequence;

//Instanciación del Detector de Secuencias
detector_secuencia uut (
    .clk(clk),
    .reset(reset),
    .sequence_in(sequence_in),
    .match_sequence(match_sequence)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    //Inicialización de señales
    reset = 0; 
    sequence_in = 0;
    #10;
    
    //Activación y desactivación del Reset
    reset = 1;
    #10;
    reset = 0;
    #10;
    
    $display("Iniciando secuencia");
    #10 sequence_in = 1; 
    #10 sequence_in = 1; 
    #10 sequence_in = 0; 
    #10 sequence_in = 1; 
    
    #10 sequence_in = 1; //Falla
    #10 sequence_in = 1; //Falla
    
    #10 sequence_in = 0; 
    #10 sequence_in = 1; 
    #10 sequence_in = 0; //Secuancia completada
    
    #10 sequence_in = 1; //Superposición
    #10 sequence_in = 1; 
    #10 sequence_in = 0; 
    #10 sequence_in = 1; 
    
    #10 sequence_in = 0;

    #50; 
    $display("Simulación terminada");
    $finish; 
end

//Monitoreo en la consola
initial begin
    $monitor("Time: %0t | Entrada: %b | MATCH: %b", 
             $time, sequence_in, match_sequence);
end

//GTKWave
initial begin
    $dumpfile("tb_sequence_detector.vcd");
    $dumpvars(0, tb_sequence_detector);
end

endmodule