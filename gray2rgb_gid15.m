function y1=gray2rgb_gid15(z)
[m,n,np]=size(z);
z=z+1;
z=0*double(z==1)+255*double(z==2)+41*double(z==3)+99*double(z==4)+158*double(z==5)+59*double(z==6)+117*double(z==7)+176*double(z==8)+235*double(z==9)+20*double(z==10)+79*double(z==11)+138*double(z==12)+196*double(z==13)+217*double(z==14)+2*double(z==15)+61*double(z==16);
y1=zeros(m,n,np);%z1µÄrgb
y1(:,:,1)=150*double(z==20)+230*double(z==41)+150*double(z==79)+200*double(z==99)+150*double(z==117)+230*double(z==138)+230*double(z==158)+150*double(z==176)+200*double(z==196)+200*double(z==235)+200*double(z==255);
y1(:,:,2)=150*double(z==2)+200*double(z==59)+200*double(z==61)+150*double(z==79)+150*double(z==99)+250*double(z==117)+200*double(z==138)+150*double(z==158)+200*double(z==176)+200*double(z==196);
y1(:,:,3)=200*double(z==2)+250*double(z==20)+150*double(z==41)+250*double(z==61)+250*double(z==79)+150*double(z==99)+150*double(z==158)+150*double(z==176)+200*double(z==217)+200*double(z==235);
y1=mat2gray(y1);

