[filename,pathname]=uigetfile('*.mp4','getvideo');
path = [pathname filename];
xyloObj = VideoReader(path);
start = 1;
nFrames = xyloObj.NumberOfFrames; %获取视频总帧数
for k = start :nFrames %遍历每一帧 
    b1 = read(xyloObj, k);
    %b1 = imresize(b1,[240,425]);% 变换图像的像素大小
    imwrite(b1,strcat('testframes2\',num2str(k),'.jpg'),'jpg');%'03052\'为当前目录下的03052文件夹
end



