clc; close all;
%Pre-lab Part 2: Using 3 output source.
x=10000;
a=zeros(1,x-1);
b=zeros(1,x-1);
c=zeros(1,x-1);
f=zeros(1,x-1);

for i=1:(x-1)
    a(i)=i/x;
    b(i)=(1-a(i))/x;
    c(i)=1-(a(i)+b(i));
    
end

for i=1:x-1
    f(i)=-((a(i))*log2(a(i))+(b(i))*log2(b(i)));
end

for i=1:x-1
    k(i)=a(i)+b(i)+c(i);
end

plot(a,f)
title('Entropy as a function of a using 3-output source')
xlabel('a');
ylabel('Entropy');