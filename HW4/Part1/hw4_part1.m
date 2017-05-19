clear all; close all; clc;

rbImage = im2double(imread('icon_back.png'));

[h, w, ~] = size(rbImage);
imshow(rbImage);

%% Mouse input
xlabel ('Select at most 100 points along the outline', 'FontName', '微軟正黑體', 'FontSize', 14);
[ ctrlPointX, ctrlPointY ] = ginput(100);
ctrlPointList = [ctrlPointX ctrlPointY];
clickedN = size(ctrlPointList,1);

promptStr = sprintf('%d points selected', clickedN);
xlabel (promptStr, 'FontName', '微軟正黑體', 'FontSize', 14);

%% Calculate Bazier Curve (Your efforts here)
outlineVertexList = ctrlPointList; %Enrich outlineVertexList

index=1;
level_rate=0.2;
for i=1:3:clickedN-1
    if(i+3>=clickedN+1)a=mod(i+3,clickedN);
    else a=i+3;
    end    
    if (i+2>=clickedN+1)b=mod(i+2,clickedN);
    else b=i+2;    
    end
    if(i+1>=clickedN+1)c=mod(i+1,clickedN);
    else c=i+1;
    end    
    for t=0:level_rate:1
   
    outlineVertexList(index,1)=(1-t)^3*ctrlPointList(i,1)+3*t*(1-t)^2*ctrlPointList(c,1)+3*t^2*(1-t)*ctrlPointList(b,1)+t^3*ctrlPointList(a,1);
    outlineVertexList(index,2)=(1-t)^3*ctrlPointList(i,2)+3*t*(1-t)^2*ctrlPointList(c,2)+3*t^2*(1-t)*ctrlPointList(b,2)+t^3*ctrlPointList(a,2);
    index=index+1;            
    end                            
end    
%% Draw and fill the polygon  Last 3 input arguments: (ctrlPointScattered, polygonPlotted, filled)
figure; result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
filename=['result_lowrate' int2str(clickedN+1) '.png'];
imwrite(result,filename);
level_rate=0.01;
for i=1:3:clickedN-1
    if(i+3>=clickedN+1)a=mod(i+3,clickedN);
    else a=i+3;
    end    
    if (i+2>=clickedN+1)b=mod(i+2,clickedN);
    else b=i+2;    
    end
    if(i+1>=clickedN+1)c=mod(i+1,clickedN);
    else c=i+1;
    end    
    for t=0:level_rate:1
   
    outlineVertexList(index,1)=(1-t)^3*ctrlPointList(i,1)+3*t*(1-t)^2*ctrlPointList(c,1)+3*t^2*(1-t)*ctrlPointList(b,1)+t^3*ctrlPointList(a,1);
    outlineVertexList(index,2)=(1-t)^3*ctrlPointList(i,2)+3*t*(1-t)^2*ctrlPointList(c,2)+3*t^2*(1-t)*ctrlPointList(b,2)+t^3*ctrlPointList(a,2);
    index=index+1;            
    end                            
end    
figure; result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
filename=['result_hightrate' int2str(clickedN+1) '.png'];
imwrite(result,filename);
result=imresize(result,4,'nearest');
figure;imshow(result);
imwrite(result,'result_b_nearest.png');
ctrlPointList = [4*ctrlPointX, 4*ctrlPointY];
clickedN = size(ctrlPointList,1);
outlineVertexList = ctrlPointList; %Enrich outlineVertexList

index=1;
for i=1:3:clickedN-1
    if(i+3>=clickedN+1)a=mod(i+3,clickedN);
    else a=i+3;
    end    
    if (i+2>=clickedN+1)b=mod(i+2,clickedN);
    else b=i+2;    
    end
    if(i+1>=clickedN+1)c=mod(i+1,clickedN);
    else c=i+1;
    end    
    for t=0:0.01:1
   
    outlineVertexList(index,1)=(1-t)^3*ctrlPointList(i,1)+3*t*(1-t)^2*ctrlPointList(c,1)+3*t^2*(1-t)*ctrlPointList(b,1)+t^3*ctrlPointList(a,1);
    outlineVertexList(index,2)=(1-t)^3*ctrlPointList(i,2)+3*t*(1-t)^2*ctrlPointList(c,2)+3*t^2*(1-t)*ctrlPointList(b,2)+t^3*ctrlPointList(a,2);
    index=index+1;            
    end                            
end    

figure; result = drawAndFillPolygon( result, ctrlPointList, outlineVertexList, true, true, true );
imwrite(result, 'result_b_cp_4.png');
