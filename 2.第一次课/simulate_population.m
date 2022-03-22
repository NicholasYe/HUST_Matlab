%% import data
clc, clear all, close all
population = readmatrix('population.xlsx');
year = population(:, 1);
US = population(:, 2);
CN = population(:, 3);

%% dealing US data
P_US = polyfit(year, US, 3);
xi_US = 1780:1:2020;  
yi_US = polyval(P_US, xi_US);  
plot(xi_US, yi_US, year, US, 'r*');

%% dealing CN data
i = find(isnan(CN));
CN(i) = zeros(size(i));
CN_alt = zeros(24, 2);
count = 1;

for i = 1:24
    if (CN(i, 1) > 0)
        CN_alt(count, 1) = year(i);
        CN_alt(count, 2) = CN(i);
        count = count + 1;
    end
end

P_CN = polyfit(CN_alt(1:12,1), CN_alt(1:12,2), 3);
xi_CN = 1780:1:2020;  
yi_CN = polyval(P_CN, xi_CN);
plot2(xi_CN, yi_CN, CN_alt(1:12,1), CN_alt(1:12,2), 'r*');





