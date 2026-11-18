/* This is a sample comment on a new routine for second commit */

// ===== PILOTO DE MARCHA =====
// Antes de 3 s: fijo. Despues de 3 s: parpadea.
Lamp_Run := Run_Cmd OR NOT (Tmr_Run.DN AND Tmr_On.DN AND Tmr_On.DN);