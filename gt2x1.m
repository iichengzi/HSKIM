function [x1,gtt15]=gt2x1(z1)
z1=rgb2gray(z1);
% yi_1=zeros(size(z1));
yi_1=1*double(z1==0)+2*double(z1==60)+3*double(z1==86)+4*double(z1==165)+5*double(z1==174)+6*double(z1==117)+7*double(z1==192)+8*double(z1==179)+9*double(z1==83)+10*double(z1==73)+11*double(z1==161)+12*double(z1==186)+13*double(z1==177)+14*double(z1==23)+15*double(z1==111)+16*double(z1==146);
yi_2=yi_1-1;
yi_2(yi_2<=0)=0;
x0=unique(yi_1);
x1=x0(x0~=0);
gtt15=yi_2;