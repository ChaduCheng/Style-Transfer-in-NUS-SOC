function I_color_res = framesexcute(pic,texture)

%I=imread(pic);
[M,N,C]=size(pic);
% figure
% imshow(I);
% title('ԭͼ')

% ��ȡ�Ҷ�ͼ
im = im2double(pic);
if C>1 
    
    % ycbcr�ռ䣬yƽ��
    Iruv = rgb2ycbcr(im);
    I_gray=Iruv(:,:,1);
else
    I_gray=im;
end

%% ����Sͼ�񲿷�

% the length of convolution line 
ks = 1; 
% the number of directions 
dirNum = 8;


% �õ�Sͼ��
S= GenStroke(I_gray,ks,dirNum);
% figure
% imshow(S)
% title('Sͼ��')

%% ֱ��ͼƥ�䲿��


J=I_gray;
% figure
% imshow(J)
% title('δƥ��ͼ')



% �����������ݻ�ȡֱ��ͼ�� ����ֵͼ��table����
a=1:255;
p3 = 1/9*exp(-(255-a)/9);
p1=1/sqrt(2*pi*11) * exp(-(a-80).*(a-80) / (2.0*11*11));
p2= 1:255;
p2(:)=1/(225-105);
p2(1:105)=0;
p2(225:255)=0;
%p = 0.52 * p1 + 0.37 * p2 + 0.11 * p3;
p = 0.32 * p1 + 2 * p2 + 0.63 * p3;
% figure
% plot(a,p)
% title('ֱ��ͼ')

% ֱ��ͼƥ��,��ԭͼ�����ͼ����⻯
J=histeq(J,p);
% figure
% imshow(J)
% title('ֱ��ͼƥ��')

%%ֱ��ͼƥ�����
%% ����ͼ��

% ��ȡ����ͼ��
P=imread(texture);
[M2,N2,C2]=size(P);
if C2>1
    P=rgb2gray(P);
end
% ������С
P=imresize(P,[M N]);
% figure
% imshow(P)

P = im2double(P);  %��׼����0~1

% figure
% imshow(P)
% title('����ͼ��')

%% ������Ⱦ����

T = GenPencil(I_gray, P, J);
T=im2double(T);
% figure
% imshow(T)
% title('������Ⱦ')

%% �������

res=T.*S;
% figure
% imshow(res);
% title('���ͼ')

% ��ʾ��ɫ����
if C>1
    
    I_color_res(:,:,1)=res;
    I_color_res(:,:,2:3)=Iruv(:,:,2:3);
    % ת����rgb�ռ�
    I_color_res = ycbcr2rgb(I_color_res);
    % �����ʾ
%     figure
%     imshow(I_color_res);
%     title('�����ɫͼ')
end
end
