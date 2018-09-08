 [filename,pathname]=uigetfile('*.mp4','getvideo');
path = [pathname filename];
xyloObj = VideoReader(path);
start = 1;
nFrames = xyloObj.NumberOfFrames; %获取视频总帧数
for k = start :nFrames %遍历每一帧 
    b1 = read(xyloObj, k);
    b1 = imresize(b1,[240,425]);% 变换图像的像素大小
    imwrite(b1,strcat('testframes1\',num2str(k),'.jpg'),'jpg');%'03052\'为当前目录下的03052文件夹
end

SamplePath1 =  'pencil_output\';  %存储图像的路径
fileExt = '*.jpg';  %待读取图像的后缀名
%获取所有路径
files = dir(fullfile(SamplePath1,fileExt)); 
len1 = size(files,1);
%lapmask = [1 1 1; 1 8 1; 1 1 1];

for k = 1105:1933
   
    b=imread(strcat('pencil_output\', num2str(k), '.jpg'));
    %I_color_res = framesexcute(b, 'textusre pic\pencil0.jpg');
   % bs = imsubtract(b, imfilter(b, lapmask, 'replicate'));
    %I_color_res = framesexcute(b, 'texture pic\pencil2.png');
    %I_color_res = GetSImg(bs);
    I_color_res = oilpaint(b, 200, 3);
    imwrite(I_color_res,strcat('paintpic\',num2str(k),'.jpg'),'jpg');
    fprintf('输出 %d \n',k)
end

for k = 1:len1
   
    b=imread(strcat('modifyframes\', num2str(k), '.jpg'));
    I_color_res = framesexcute(b, 'texture pic\pencil2.jpg');
    imwrite(I_color_res,strcat('pencilimg1\',num2str(k),'.jpg'),'jpg');
     fprintf('输出 %d \n',k)
end

path = 'paintpic\';                  %'whiteCar2\'为当前目录下的whiteCar2文件夹
writerObj = VideoWriter('output_paint.avi');   %将生成的视频保存为名称为'car.avi'的视频
open(writerObj);
for i = 1002:2500
   frame = imread(strcat(path,num2str(i),'.jpg'));%从文件夹中读取图像
   writeVideo(writerObj,frame);
end
close(writerObj);
