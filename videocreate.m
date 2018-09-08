path = 'pencilimg1\';                  %'whiteCar2\'为当前目录下的whiteCar2文件夹
writerObj = VideoWriter('modify.avi');   %将生成的视频保存为名称为'car.avi'的视频
open(writerObj);
for i = 1:2473
   frame = imread(strcat(path,num2str(i),'.jpg'));%从文件夹中读取图像
   writeVideo(writerObj,frame);
end
close(writerObj);