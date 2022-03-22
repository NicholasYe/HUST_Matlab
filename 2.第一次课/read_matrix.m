clc, clear, close all

%Create two matrices in the workspace.
M1 = magic(5);
M2 = [5 10 15 20 25; 30 35 40 45 50];
M3 = rand(5);
%Write the matrix M1 to a spreadsheet file, M.xls.
writematrix(M1,'M.xls')
%Import numeric data from M.xls into a matrix
N1 = readmatrix('M.xls')

%Append the data in matrix M2 below the existing data in the spreadsheet file.
writematrix(M2, 'M.xls', WriteMode='append')
%Import numeric data from M.xls into a matrix
N2 = readmatrix('M.xls')

%Write the matrix M1 to M.xls, to the second worksheet in the file, starting at the third row.
writematrix(M3,'M.xls','Sheet','Sheet2','Range','A3:E7')
%Import numerical data, as a matrix, from a specified sheet and range.
N3 = readmatrix('M.xls','Sheet','Sheet2','Range','A3:E7')
