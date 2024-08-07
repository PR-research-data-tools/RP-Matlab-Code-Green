
close all;							%关闭当前所有图形窗口，清空工作空间变量，清除工作空间所有变量
J = imread('huangguahua.jpg');				%读入要处理的图像，并赋值给J
hsv = rgb2hsv(J);                   %图像由RGB空间变换到HSV空间
h = hsv(:, :, 1);                     %为色调h赋值
s = hsv(:, :, 2);                     %为饱和度s赋值
v = hsv(:, :, 3);                     %为亮度v赋值

set(0,'defaultFigurePosition',[100,100,1000,500]);	%修改图形图像位置的默认设置
set(0,'defaultFigureColor',[1,1,1])

helpFun(J, h);
helpFun(s, v);

figure;
subplot(131);
imhist(h); 	      	%显示色调h的直方图
subplot(132);
imhist(s);              %显示饱和度s的直方图
subplot(133);
imhist(v);              %显示亮度v的图

function helpFun(im1, im2)
figure;
subplot(121);
imshow(im1);                           %显示原图
subplot(122);
imshow(im2);         %基于色调h的灰度图像
end