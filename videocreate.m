path = 'pencilimg1\';                  %'whiteCar2\'Ϊ��ǰĿ¼�µ�whiteCar2�ļ���
writerObj = VideoWriter('modify.avi');   %�����ɵ���Ƶ����Ϊ����Ϊ'car.avi'����Ƶ
open(writerObj);
for i = 1:2473
   frame = imread(strcat(path,num2str(i),'.jpg'));%���ļ����ж�ȡͼ��
   writeVideo(writerObj,frame);
end
close(writerObj);