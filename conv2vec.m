function [outputArg] = conv2vec(inputArg)
%CONV2VEC 此处显示有关此函数的摘要
%   此处显示详细说明
outputArg = 1*double(inputArg==0)+2*double(inputArg==99)+3*double(inputArg==110)+4*double(inputArg==121)+5*double(inputArg==132)+6*double(inputArg==11)+7*double(inputArg==22)+8*double(inputArg==33)+9*double(inputArg==88)+10*double(inputArg==55)+11*double(inputArg==44)+12*double(inputArg==77)+13*double(inputArg==66)+14*double(inputArg==143)+15*double(inputArg==154)+16*double(inputArg==165);
end

