function y=gray2rgb(x)
[m,n]=size(x);
x=x+1;
y=zeros(m,n,3);
y(:,:,1)=255*double(x==3)+255*double(x==6);
y(:,:,2)=255*double(x==4)+255*double(x==5)+255*double(x==6);
y(:,:,3)=255*double(x==2)+255*double(x==5);
y=mat2gray(y);