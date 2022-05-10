function PSED=PSED(x)
Bound=[30 150];

if nargin==0
    PSED = Bound;
else
    PSED=0.0007*x^2+0.3*x+4+0.0004*(100-x)^2+0.32*(100-x)+3;
end