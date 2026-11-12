// ===== PARO / MARCHA CON INVERSOR (FWD / BWD) =====
IF NOT Run_Cmd THEN
    IF PB_Fwd AND NOT PB_Bwd THEN
        Dir_Fwd := 1;
    END_IF;
    IF PB_Bwd AND NOT PB_Fwd THEN
        Dir_Fwd := 0;
    END_IF;
END_IF;

Run_Cmd := (PB_Start OR Run_Cmd) AND PB_Stop AND NOT VFD_Fault;

Out_Fwd  := Run_Cmd AND Dir_Fwd;
Out_Bwd  := Run_Cmd AND NOT Dir_Fwd;
Lamp_Run := Run_Cmd;