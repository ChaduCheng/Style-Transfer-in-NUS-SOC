
SamplePath1 =  'testframes\';  %�洢ͼ���·��
fileExt = '*.jpg';  %����ȡͼ��ĺ�׺��
%��ȡ����·��
files = dir(fullfile(SamplePath1,fileExt)); 
len1 = size(files,1);

for k = 1:len1
   
    b=imread(strcat('modifyframes\', num2str(k), '.jpg'));
    I_color_res = framesexcute(b, 'texture pic\pencil2.jpg');
    imwrite(I_color_res,strcat('pencilimg1\',num2str(k),'.jpg'),'jpg');
     fprintf('��� %d \n',k)
end



