

% Differential box counting method

image = imread('test3-2.jpg');
grayimage = rgb2gray(image);
[a, b] = size(grayimage);

unit_level = im2double(grayimage);

N = 0; % sum matrix
r = 1; % length of unit box
k = 1; % min grey level
l = 0; % max grey level

for i = 1:r:a
	for j = 1:r:b
            for x = i:i+5
                if x > a
                    break;
                end
                    for y = j:j+5
                        if y > b
                            break;
                        end
                        if unit_level(x,y) < k
                            k = unit_level(x,y);
                        elseif unit_level(x,y) > l
                            l = unit_level(x,y);
                        end
                    end
            end
            N = N + r*r*(l-k+1);
	end
end

D = log(N)/log(a/r);
display(D);
