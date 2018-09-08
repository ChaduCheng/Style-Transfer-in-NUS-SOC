function [oilout]=oilpaint(org_pic,intense,radius)

%intense - decide the color range
%radius  - decide the size of color block 

%pre-processing
org_pic=uint16(org_pic);
imsize=size(org_pic);
height=imsize(1);
width=imsize(2);
oilout=zeros(height,width,3);
%process
%tense-detect
for j=1:height
    for k=1:width 
        count_intense=zeros(intense,1);%for each intensity, contain frequency
        %sum 3 color
        sum_thisRadius_r=uint16(zeros(intense,1));
        sum_thisRadius_g=uint16(zeros(intense,1));
        sum_thisRadius_b=uint16(zeros(intense,1));
        for x=(j-radius):(j+radius)
            for y=(k-radius):(k+radius)
                if (x>0&&x<=height&&y>0&&y<=width)
                intensity_now=round((org_pic(x,y,1)+org_pic(x,y,2)+org_pic(x,y,3))/3*intense/255);
                if intensity_now==0
                    intensity_now=1;
                end
                count_intense(intensity_now)=count_intense(intensity_now)+1;
                sum_thisRadius_r(intensity_now)=sum_thisRadius_r(intensity_now)+org_pic(x,y,1);
                sum_thisRadius_g(intensity_now)=sum_thisRadius_g(intensity_now)+org_pic(x,y,2);
                sum_thisRadius_b(intensity_now)=sum_thisRadius_b(intensity_now)+org_pic(x,y,3);
                end
            end
        end
        max_intensity=max(count_intense);%the most frequence intensity
        for x=1:intense
            if count_intense(x)==max_intensity
                index=x;%get the color of the max frequence intensity
            end
        end
        oilout(j,k,1)=sum_thisRadius_r(index)/count_intense(index);
        oilout(j,k,2)=sum_thisRadius_g(index)/count_intense(index);
        oilout(j,k,3)=sum_thisRadius_b(index)/count_intense(index);
    end
end

oilout=uint8(oilout);   
end