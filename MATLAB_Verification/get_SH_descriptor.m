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
    grid(y1(i)+1,x1(i)+1,z1(i)+1) = 1;
end

%get coordinates of grid voxel
temp=reshape(grid,prod(size(grid)),1);
[y_grid,x_grid,z_grid] = ind2sub(size(grid),find(temp==1));
% x_grid = [];
% y_grid = [];
% z_grid = [];
% for i = 1:2*R
%     for j = 1:2*R
%         for k = 1:2*R
%             if(grid(i,j,k)==1)
%                 y_grid = [y_grid; i];
%                 x_grid = [x_grid; j];
%                 z_grid = [z_grid; k];
%             end
%         end
%     end
% end

%get center of mass
x_center = mean(x_grid);
y_center = mean(y_grid);
z_center = mean(z_grid);

%move center of mass to (R,R,R)
x_grid = x_grid + (R - x_center);
y_grid = y_grid + (R - y_center);
z_grid = z_grid + (R - z_center);

%verify
% mean(x_grid)
% mean(y_grid)
% mean(z_grid)

%scale and make the average distance to CoM (center of mass) is R/2;
dist = sqrt((x_grid-R).^2 + (y_grid-R).^2 + (z_grid-R).^2);
mean_dist = mean(dist);
scale_ratio = (R/2)/mean_dist;
x_grid = x_grid - R; %move to origin
x_grid = x_grid * scale_ratio;
x_grid = x_grid + R; %move back

y_grid = y_grid - R; %move to origin
y_grid = y_grid * scale_ratio;
y_grid = y_grid + R; %move back

z_grid = z_grid - R; %move to origin
z_grid = z_grid * scale_ratio;
z_grid = z_grid + R; %move back

%verify
% dist = sqrt((x_grid-R).^2 + (y_grid-R).^2 + (z_grid-R).^2);
% mean_dist = mean(dist)

%draw
scatter3(x1,y1,z1,5,[0 0 1],'.'); view([60,-60,60]);
figure,
scatter3(x_grid,y_grid,z_grid,5,[0 0 1],'.'); view([60,-60,60]);
hold on
scatter3(x_center,y_center,z_center,5,[0 0 100],'r*'); view([60,-60,60]);

%get SH
% max radius is ceil(R*sqrt(2)) = 46; so we set m and r = 46
m = 46;
r = 46;

