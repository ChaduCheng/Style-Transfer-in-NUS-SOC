 [filename,pathname]=uigetfile('*.mp4','getvideo');
path = [pathname filename];
xyloObj = VideoReader(path);
start = 1;
nFrames = xyloObj.NumberOfFrames; %��ȡ��Ƶ��֡��
for k = start :nFrames %����ÿһ֡ 
    b1 = read(xyloObj, k);
    b1 = imresize(b1,[240,425]);% �任ͼ������ش�С
    imwrite(b1,strcat('testframes1\',num2str(k),'.jpg'),'jpg');%'03052\'Ϊ��ǰĿ¼�µ�03052�ļ���
end

SamplePath1 =  'pencil_output\';  %�洢ͼ���·��
fileExt = '*.jpg';  %����ȡͼ��ĺ�׺��
%��ȡ����·��
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
    fprintf('��� %d \n',k)
end

for k = 1:len1
   
    b=imread(strcat('modifyframes\', num2str(k), '.jpg'));
    I_color_res = framesexcute(b, 'texture pic\pencil2.jpg');
    imwrite(I_color_res,strcat('pencilimg1\',num2str(k),'.jpg'),'jpg');
     fprintf('��� %d \n',k)
end

path = 'paintpic\';                  %'whiteCar2\'Ϊ��ǰĿ¼�µ�whiteCar2�ļ���
writerObj = VideoWriter('output_paint.avi');   %�����ɵ���Ƶ����Ϊ����Ϊ'car.avi'����Ƶ
open(writerObj);
for i = 1002:2500
   frame = imread(strcat(path,num2str(i),'.jpg'));%���ļ����ж�ȡͼ��
   writeVideo(writerObj,frame);
end
close(writerObj);
