evalin('base','clear');
I = imread('input.jpg'); %读取test图片（为三�?�道彩色图片�? 
image0 = rgb2gray(I);%%%将RGB图片转换为灰度图�?
image=image0;
fid=fopen('input.txt','r');
keyBin=fread(fid,'ubit1');
[m,n]=size(image);
[x,y]=size(keyBin);
length=x*y;
rng(1,'twister');
row=randi(m,1,length);
col=randi(n,1,length);
%在LSB隐藏信息
i=1;
for a=1:x
    for b=1:y
        image(row(i),col(i))=image(row(i),col(i))-mod(image(row(i),col(i)),2)+keyBin(a,b);%在�?�取像素点二进制表示的最后一位进行修�?
        i=i+1;
    end
    if a==x && b==y &&i==length+1
        break;
    end
end
image=uint8(image);
imwrite(image,'output.png');
%显示实验结果
subplot(1,2,1);imshow(image0);title('ԭʼͼƬ');
subplot(1,2,2);imshow(image);title('���ɺ��ͼƬ');




