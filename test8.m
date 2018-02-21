iteration = 50;
point = 500;

r = 3/4;
newpoint = round(point*r);
x = linspace(-2.5, 1.5, point);
y = linspace(-1.5, 1.5, newpoint);

[a, b] = meshgrid(x, y);

Z = a + 1i*b;
A = zeros(newpoint, point);
Zn = A;

for i = 1:iteration
    Zn = Zn.*Zn + Z;
    A = A + (abs(Zn)<2);
end;

imagesc(A);
colormap(jet);

axis off