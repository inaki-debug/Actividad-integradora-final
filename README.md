# Actividad-integradora-final

Se diseñó en Verilog un detector de secuencia el cual tiene como entrada una secuencia de bits `sequence_in` y como salida tiene un `match_sequence` el cual se activa en 1 cuando detecta la secuencia `11010`

### Diagrama de transición de estados

Se diseñó un diagrama de transición de estados con los estados S1, S2, S3, S4 y S5.

<img width="1920" height="1080" alt="1 1 1 0 1 0" src="https://github.com/user-attachments/assets/dbae7993-4dae-45a3-9801-36e672a57613" />

###  Verificacióon del sistema (Testbench)

Después de diseñar la máquina de estados en Verilog, se diseñó un Testbench el cual se inseetó la secuencia `11011101011010` para verificar que cuando la secuencia falle si regrese al estado que debe regresar y verificar que `match_sequence` esté en 1 cuando la secuencia sea verdadera.

Estos fueron los resultados en el monitor:

```
Time: 0 | Entrada: 0 | MATCH: 0
Iniciando secuencia
Time: 40 | Entrada: 1 | MATCH: 0
Time: 60 | Entrada: 0 | MATCH: 0
Time: 70 | Entrada: 1 | MATCH: 0
Time: 100 | Entrada: 0 | MATCH: 0
Time: 110 | Entrada: 1 | MATCH: 0
Time: 120 | Entrada: 0 | MATCH: 0
Time: 125 | Entrada: 0 | MATCH: 1
Time: 130 | Entrada: 1 | MATCH: 0
Time: 150 | Entrada: 0 | MATCH: 0
Time: 160 | Entrada: 1 | MATCH: 0
Time: 170 | Entrada: 0 | MATCH: 0
Time: 175 | Entrada: 0 | MATCH: 1
Time: 185 | Entrada: 0 | MATCH: 0
Simulaci├│n terminada
```

Después se utilizó GTKWave para visualizar el gráfico de ondas.

<img width="1290" height="641" alt="image" src="https://github.com/user-attachments/assets/96d2913e-90c8-4f53-ae8b-22d4a6b800bd" />



