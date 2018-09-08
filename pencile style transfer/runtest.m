
SamplePath1 =  'testframes\';  %存储图像的路径
fileExt = '*.jpg';  %待读取图像的后缀名
%获取所有路径
files = dir(fullfile(SamplePath1,fileExt)); 
len1 = size(files,1);

for k = 1:len1
   
    b=imread(strcat('modifyframes\', num2str(k), '.jpg'));
    I_color_res = framesexcute(b, 'texture pic\pencil2.jpg');
    imwrite(I_color_res,strcat('pencilimg1\',num2str(k),'.jpg'),'jpg');
     fprintf('输出 %d \n',k)
end



