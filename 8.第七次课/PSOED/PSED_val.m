function PSED=PSED_val(x)
Bound=[30 150];

if nargin==0
    PSED = Bound;
else
    PSED=0.0007*x^2+0.3*x+4+abs(10*sin(0.0315*4*(30-x)))+0.0004*(100-x)^2+0.32*(100-x)+3+abs(3*sin(0.0315*12*(0-(100-x))));
end
end