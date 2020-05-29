clc; close all;
%Pre-lab Part 1: Using 2 output source.
x=10000;
a=zeros(1,x-1);
b=zeros(1,x-1);
f=zeros(1,x-1);

for i=1:(x-1)
    a(i)=i/x;
    b(i)=1-i/x;
    
end

for i=1:x-1
    f(i)=-((a(i))*log2(a(i))+(b(i))*log2(b(i)));
end

plot(a,f)
title('Entropy as a function of a using 2-output source')
xlabel('a');
ylabel('Entropy');