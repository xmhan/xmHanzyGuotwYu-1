

phi = inline('z^2+0.36+1i*0.1');

colormap([1 0 0; 0.8 0 0; 0.6 0 0; 0.4 0 0; 0.2 0 0; 1 1 1]);

M = 6*ones(301, 201);

for j = 1:301
    y = -1.5 + (j-1) * 0.01;
    
    for i = 1:201
        x = -1 + (i-1) * 0.01;
        z = x + 1i*y;
        zk = z;
        kount = 0;
        
        while kount < 100 && abs(zk) < 100
            kount = kount + 1;
            zk = phi(zk);
        end
        
        if abs(zk) >= 100
            if kount <= 100 && kount >= 80, M(j,i) = 1; end;
            if kount < 80 && kount >= 60, M(j,i) = 2; end;
            if kount < 60 && kount >= 40, M(j,i) = 3; end;
            if kount < 40 && kount >= 20, M(j,i) = 4; end;
            if kount < 20 && kount >= 0, M(j,i) = 5; end;
        end
    end
end

image([-1 1], [-1.5 1.5], M),
axis xy