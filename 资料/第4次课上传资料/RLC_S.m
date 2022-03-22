%%
R = 1;
L = 1;
C = 1;
VC_int = 5;
IL_int = 1;
IC_int = -VC_int/R-IL_int;
%%
simout = sim('RLC');
simout1 = sim('RLC_SIM');