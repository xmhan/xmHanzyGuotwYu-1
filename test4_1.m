

% Reticular cell counting method

image = imread('test3-2.jpg');
grayimage = rgb2gray(image);
[a, b] = size(grayimage);

n = 0;

for i = 1:3:a
	for j = 1:3:b
        if grayimage(i,j) ~= 255
            n = n + 1;
        end
	end
end

D = log(n)/log(a/3);
display(D);