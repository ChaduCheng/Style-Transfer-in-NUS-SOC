function I_color_res = framesexcute(pic,texture)

%I=imread(pic);
[M,N,C]=size(pic);
% figure
% imshow(I);
% title('原图')

% 获取灰度图
im = im2double(pic);
if C>1 
    
    % ycbcr空间，y平面
    Iruv = rgb2ycbcr(im);
    I_gray=Iruv(:,:,1);
else
    I_gray=im;
end

%% 计算S图像部分

% the length of convolution line 
ks = 1; 
% the number of directions 
dirNum = 8;


% 得到S图像
S= GenStroke(I_gray,ks,dirNum);
% figure
% imshow(S)
% title('S图像')

%% 直方图匹配部分


J=I_gray;
% figure
% imshow(J)
% title('未匹配图')



% 根据论文数据获取直方图， 参数值图中table给出
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
% title('直方图')

% 直方图匹配,对原图像进行图像均衡化
J=histeq(J,p);
% figure
% imshow(J)
% title('直方图匹配')

%%直方图匹配结束
%% 纹理图像

% 读取纹理图像
P=imread(texture);
[M2,N2,C2]=size(P);
if C2>1
    P=rgb2gray(P);
end
% 调整大小
P=imresize(P,[M N]);
% figure
% imshow(P)

P = im2double(P);  %标准化至0~1

% figure
% imshow(P)
% title('纹理图像')

%% 纹理渲染部分

T = GenPencil(I_gray, P, J);
T=im2double(T);
% figure
% imshow(T)
% title('纹理渲染')

%% 结果部分

res=T.*S;
% figure
% imshow(res);
% title('结果图')

% 显示彩色部分
if C>1
    
    I_color_res(:,:,1)=res;
    I_color_res(:,:,2:3)=Iruv(:,:,2:3);
    % 转换回rgb空间
    I_color_res = ycbcr2rgb(I_color_res);
    % 结果显示
%     figure
%     imshow(I_color_res);
%     title('结果颜色图')
end
end
