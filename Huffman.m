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

symbols = [cellstr(num2str([0:9]'));cellstr(char(97:122)')];
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