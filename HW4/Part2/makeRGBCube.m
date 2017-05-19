clear all; close all; clc;

%% Define Vertices
topVerts = [ 0 1 0; 0 1 1; 1 1 1; 1 1 0];
topVertIndex = [ 1 2 3 4 ];
botVerts = [ 0 0 0; 0 0 1; 1 0 1; 1 0 0];
botVertIndex = [ 5 6 7 8 ];

verts = [ topVerts; botVerts ];

%% Define Colors
vertColors = [ topVerts; botVerts ];
%% Empty faces list
faces = [];

%% Top faces
faces = [ faces ; 1 2 3 ; 1 3 4 ];

%% Side faces (Your efforts here)
for vertI = 1 : 4
	faceVert1 = topVertIndex( mod(vertI,4)+1 );
	faceVert2 = topVertIndex( vertI );
	faceVert3 = botVertIndex( vertI );
    faceVert11 = botVertIndex( mod(vertI,4)+1 );
	faceVert21 = botVertIndex( vertI );
	faceVert31 = topVertIndex( mod(vertI,4)+1 );
	faces = [ faces ; faceVert1 faceVert2 faceVert3 ; faceVert11,faceVert21,faceVert31 ];
end

%% Bottom faces
faces = [ faces ; 5 7 6 ; 5 8 7 ];

%% Show RGB Cube in 3D figure
trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0);