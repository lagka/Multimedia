clear all
close all
%% show the obj file at 3D figure
al = fopen('al7KC.obj');

vertex_al = fscanf(al,'v %f %f %f %f %f %f\n',[6, Inf])';
faces_al = fscanf(al,'f %f %f %f\n',[3, Inf])';

fclose(al);

vertex = vertex_al(:,1:3);
offset=length(vertex);
%fprintf('%d\n',offset);
[m,n]=size(vertex);
x_max=realmin;
y_max=realmin;
z_max=realmin;
for i=1:m
    for j=1:n
        if j==1
            if vertex(i,j)>x_max
                x_max=vertex(i,j);
            end
        elseif j==2
            if vertex(i,j)>y_max
               y_max=vertex(i,j); 
            end    
        elseif j==3
            if vertex(i,j)>z_max
                z_max=vertex(i,j);
            end
        end    
    end
end    
x_min=realmax;
y_min=realmax;
z_min=realmax;
for i=1:m
    for j=1:n
        if j==1
            if vertex(i,j)<x_min
                x_min=vertex(i,j);
            end
        elseif j==2
            if vertex(i,j)<y_min
               y_min=vertex(i,j); 
            end    
        elseif j==3
            if vertex(i,j)<z_min
                z_min=vertex(i,j);
            end
        end    
    end
end
faces = faces_al;
colors = vertex_al(:,4:6);
 figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);

vertex=[vertex(:,1)-(x_max+x_min)/2,vertex(:,2)-(y_max+y_min)/2,vertex(:,3)-(z_max+z_min)/2];
figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
%% Adding the HSV color cylinder onto the same world space as al7KC.obj, and then do some transformation
% (Hint) You can try to combine 2 objects' vertices, faces together
numOfVert = 60;
vertsPolarAngle=linspace(0,2*pi,numOfVert+1)';
vertsX=cos(vertsPolarAngle);
vertsY=sin(vertsPolarAngle);
[m,n]=size(vertsX);

%Top faces
topvert=[0,0,0.5];
botvert=[0,0,-0.5];
faces_c=[];
for i=1:numOfVert
   topvert=[topvert;vertsX(i,1),vertsY(i,1),0.5];
   if i+2>numOfVert+1
       a=2;
   else 
       a=i+2;
   end    
   faces_c=[faces_c;1,i+1,a];
end    
[a,b]=size(topvert);

%Side face
   for v=1:numOfVert
      if v+2>numOfVert+1
         a=2; 
      else
          a=v+2;
      end    
       if numOfVert+v+3>numOfVert*2+2
          b=numOfVert+3;
      else
         b=numOfVert+v+3; 
      end    
      faceVert1=v+1;
      faceVert2=a;
      faceVert3=numOfVert+v+2;
      faceVert11=a;
      faceVert12=b;
      faceVert13=numOfVert+2+v;
      
      faces_c=[faces_c;faceVert1,faceVert2,faceVert3;faceVert11,faceVert12,faceVert13];
   end   
% %Bottom faces

for i=1:numOfVert
    botvert=[botvert;vertsX(i),vertsY(i),-0.5];
    if numOfVert+i+3>numOfVert*2+2
        b=numOfVert+4;
    else
        b=numOfVert+i+3;
    end    
    faces_c=[faces_c;numOfVert+2,numOfVert+i+2,b];
end    
[a,b]=size(botvert);

verts=[topvert;botvert];
[a,b]=size(verts);
topColor=[0,0,1];
botColor=[0,0,0];
for i=1:numOfVert
    topColor=[topColor;vertsPolarAngle(i)/(2*pi),1,1];
    botColor=[botColor;vertsPolarAngle(i)/(2*pi),1,0];
end    
vertColors = [ topColor; botColor ];
vertColors=hsv2rgb(vertColors);
faces=[faces;faces_c(:,1)+offset faces_c(:,2)+offset faces_c(:,3)+offset ];
figure;trisurf(faces_c,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0);
shift_vert(:,1)=verts(:,1);
shift_vert(:,2)=verts(:,2)+2.5;
shift_vert(:,3)=verts(:,3)-2.5;
vertex=[vertex;shift_vert(:,1),shift_vert(:,2),shift_vert(:,3)];
colors=[colors;vertColors(:,1),vertColors(:,2),vertColors(:,3)];
figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
%% Lighting (You may need to modify the lighting here)
ka=[1.0,0.1,0.1,0.1];
kd=[0.0,1.0,0.1,0.8];
ks=[0.0,0.0,1.0,1.0];


figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
l1 = light('Style', 'local', 'Visible', 'on');
lighting phong;


figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
l2 = light('Style', 'infinite', 'Visible', 'on');
lighting phong;

figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
l2 = light('Position',[0.0,0.0,10.0], 'Style', 'infinite', 'Visible', 'on');
lighting phong;
material([ka(1) kd(1) ks(1)]);


figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
l3 = light('Position',[0.0,0.0,10.0], 'Style', 'infinite', 'Visible', 'on');
lighting phong;
material([ka(2), kd(2) ,ks(2)]);

figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
l4 = light('Position',[0.0,0.0,10.0], 'Style', 'local', 'Visible', 'on');
lighting phong;
material([ka(3), kd(3) ,ks(3)]);

figure;trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
l5 = light('Position',[0.0,0.0,10.0], 'Style', 'infinite', 'Visible', 'on');
lighting phong;
material([ka(4), kd(4) ,ks(4)]);


