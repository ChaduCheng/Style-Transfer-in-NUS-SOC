clear
clc
close all

%% ��ȡͼƬ����

I=imread('pic\3--38.jpg');
[M,N,C]=size(I);
figure
imshow(I);
title('ԭͼ')

% ��ȡ�Ҷ�ͼ
im = im2double(I);
if C>1 
    
    % ycbcr�ռ䣬yƽ��
    Iruv = rgb2ycbcr(im);
    I_gray=Iruv(:,:,1);
else
    I_gray=im;
end

%% ����Sͼ�񲿷�

% the length of convolution line 
ks = 3; 
% the number of directions 
dirNum = 8;


% �õ�Sͼ��
S= GenStroke(I_gray,ks,dirNum);
figure
imshow(S)
title('Sͼ��')