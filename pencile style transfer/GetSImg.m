function S = GetSImg(I)

   [M,N,C]=size(I);
% figure
% imshow(I);
% title('原图')

   % 获取灰度图
   im = im2double(I);
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

end