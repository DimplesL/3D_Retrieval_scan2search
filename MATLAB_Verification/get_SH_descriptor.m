% This script is to get Spherical Harmonics Descriptors
clc
clear
close all

fv = stlread('femur.stl');
vertices = fv.vertices;

x1 = vertices(:,1);
y1 = vertices(:,2);
z1 = vertices(:,3);

%align coordinates
x1 = x1-min(x1);
y1 = y1-min(y1);
z1 = z1-min(z1);

%normalize to 1
max_value = max([max(x1),max(y1),max(z1)]);
x1 = x1./max_value;
y1 = y1./max_value;
z1 = z1./max_value;

%rasterize to 2Rx2Rx2R voxel grid
R = 32;
x1 = round(x1*2*R);
y1 = round(y1*2*R);
z1 = round(z1*2*R);

grid = zeros(2*R,2*R,2*R); 
n_points = length(x1);
for i = 1:n_points
    grid(y1(i)+1,z1(i)+1,z1(i)+1) = 1;
end

%get coordinates of grid voxel
temp=reshape(grid,prod(size(grid)),1);
[x_grid,y_grid,z_grid] = ind2sub(size(grid),find(temp==1));
% x_grid = [];
% y_grid = [];
% z_grid = [];
% for i = 1:2*R
%     for j = 1:2*R
%         for k = 1:2*R
%             if(grid(i,j,k)==1)
%                 x_grid = [x_grid; i];
%                 y_grid = [y_grid; j];
%                 z_grid = [z_grid; k];
%             end
%         end
%     end
% end

%draw
scatter3(x1,y1,z1,5,[0 0 1],'.'); view([60,-60,60]);
figure,
scatter3(x_grid,y_grid,z_grid,5,[0 0 1],'.'); view([60,-60,60]);

