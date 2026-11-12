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

Out_Fwd := Run_Cmd AND Dir_Fwd;
Out_Bwd := Run_Cmd AND NOT Dir_Fwd;

// ===== TEMPORIZADOR: 3 s EN MARCHA =====
Tmr_Run.PRE := 3000;
Tmr_Run.TimerEnable := Run_Cmd;
TON(Tmr_Run);

// ===== OSCILADOR: 1 s ON / 0,5 s OFF (solo tras los 3 s) =====
Tmr_On.PRE := 1000;
Tmr_On.TimerEnable := Tmr_Run.DN AND NOT Tmr_Off.DN;
TON(Tmr_On);

Tmr_Off.PRE := 500;
Tmr_Off.TimerEnable := Tmr_On.DN;
TON(Tmr_Off);

// ===== PILOTO DE MARCHA =====
// Antes de 3 s: fijo. Despues de 3 s: parpadea.
Lamp_Run := Run_Cmd OR NOT (Tmr_Run.DN AND Tmr_On.DN);