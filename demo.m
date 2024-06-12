% plaese replace with your data paths
gt5path='J:\cyc\GID_15\gt_5\';%path of gt5
lab5path='J:\cyc\CNN_result\result\ann_1\';% path of cnn results on layer 1 
gt15path='J:\cyc\GID_15\gt_15\';%path of gt5
lab15path='J:\cyc\CNN_result\result\gid15_ann_3.14_cheng11\';%path of cnn results on layer 2
imagepath='J:\cyc\GID_15\image\';% iuput image path
imagedir=dir([imagepath '*.tif']);
gt5dir=dir([gt5path '*.tif']);
lab5dir=dir([lab5path '*.tif']);
gt15dir=dir([gt15path '*.tif']);
lab15dir=dir([lab15path '*.tif']);
len=length(imagedir);
for k=1:10
    y=imread([imagepath imagedir(k).name]);
    lab5=imread([lab5path lab5dir(k).name]);
    gt5=imread([gt5path gt5dir(k).name]);
    lab15=imread([lab15path lab15dir(k).name]);
    gtt15=imread([gt15path gt15dir(k).name]);
    x_lab15=double(unique(gtt15)+1);
    lab15=conv2vec(lab15);
    lab5=lab5./55+1;
    lab5(gt5==0)=0;
    lab15(gtt15==0)=0;
    or1=unique(gt5);or2=unique(lab5);
    len1=length(or1);len2=length(or2);
    if len1<len2
        x_lab5=double(or1+1);
    else
        x_lab5=double(or2+1);
    end
    f=HSKIM_main(y,lab15,lab5,x_lab15,x_lab5);
end
