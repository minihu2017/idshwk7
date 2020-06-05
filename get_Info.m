evalin('base','clear');
length=112;
cover = imread('output.png');
[m,n]=size(cover);
fopen('getInfor.txt','w');
frr=fopen('getInfor.txt','a+');
rng(1,'twister');
row=randi(m,1,length);
col=randi(n,1,length);
p=1;
a=1;
b=0;
for i=1:length
    mod(cover(row(i),col(i)),2)
    if mod(cover(row(i),col(i)),2)==1
        fwrite(frr,a,'ubit1');
    else 
        fwrite(frr,b,'ubit1');
    end
    if p==length
        break;
    end
    p=p+1;
end
fclose(frr);
