[filename,pathname]=uigetfile('*.mp4','getvideo');
path = [pathname filename];
xyloObj = VideoReader(path);
start = 1;
nFrames = xyloObj.NumberOfFrames; %��ȡ��Ƶ��֡��
for k = start :nFrames %����ÿһ֡ 
    b1 = read(xyloObj, k);
    %b1 = imresize(b1,[240,425]);% �任ͼ������ش�С
    imwrite(b1,strcat('testframes2\',num2str(k),'.jpg'),'jpg');%'03052\'Ϊ��ǰĿ¼�µ�03052�ļ���
end



