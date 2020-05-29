% Part 1
clc; close all;

fid = fopen('Code.txt');
ns = textscan(fid, '%s');
fclose(fid);

%Convert to chars
chars = reshape(char(ns{:}),[],1);
doubles = double(chars);

%Count of each letter (not case sensitive) 
count_lettters = sum(bsxfun(@eq,chars,97:122),1) + sum(bsxfun(@eq,chars,65:90),1);
count_numbers = sum(bsxfun(@eq,chars,48:57),1);

%Count of different characters and count of number of each char used
counts = [count_numbers count_lettters];

symbols = [cellstr(num2str([0:9]')) ; cellstr(char(97:122)')];
prob=(counts./sum(counts))';

dict = huffmandict(symbols,prob);
comp = huffmanenco(chars,dict);
dsig = huffmandeco(comp,dict);

A = cellstr(chars);
isequal(A,dsig)

bar(counts./sum(counts))
set(gca, 'XTickLabel',symbols,'XTick',1:numel(symbols))

xlabel('ASCII Characters')
ylabel('Probability Distribution')
%___________________________________________________________________
% Part 2
n=7; k=4;
pol = cyclpoly(n,k);
parmat = cyclgen(n,pol);
genmat = gen2par(parmat);
encData = encode(comp,n,k,'linear/binary',genmat);

% Changing data to make errors intentionally
encData(1) = ~encData(1);
encData(2) = ~encData(2);
encData(3) = ~encData(3);
encData(4) = ~encData(4);
encData(5) = ~encData(5);
encData(6) = ~encData(6);
encData(7) = ~encData(7);
encData(8) = ~encData(8);
encData(9) = ~encData(9);
encData(10) = ~encData(10);

decData = decode(encData,n,k,'linear/binary',genmat);

%Number of errors
numErr = biterr(comp,decData);