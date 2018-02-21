f = inline('z^4-1');
fprime = inline('4*z^3');

root1 = exp(1i*0);
root2 = exp(1i*1/2*pi);
root3 = exp(1i*pi);
root4 = exp(1i*3/2*pi);

colormap([1 0 0; 0 1 0; 0 0 1; 0 1 1; 1 1 1]);

M = 5*ones(201,201);

for j = 1:201
    y = -1 + (j-1) * 0.01;
    
    for i = 1:201
        x = -1 + (i-1) * 0.01;
        z = x + 1i*y;
        zk = z;
        
        iflag1 = 0;
        iflag2 = 0;
        iflag3 = 0;
        iflag4 = 0;
        kount = 0;

        while kount < 100 && iflag1 < 5 && iflag2 < 5 && iflag3 < 5 && iflag4 < 5
            kount = kount + 1;
            zk = zk - f(zk)/fprime(zk);
            
            err1 = abs(zk-root1);
            if err1 < 1.e-6, iflag1 = iflag1 + 1; else, iflag1 = 0; end;
            
            err2 = abs(zk-root2);
            if err2 < 1.e-6, iflag2 = iflag2 + 1; else, iflag2 = 0; end;
            
            err3 = abs(zk-root3);
            if err3 < 1.e-6, iflag3 = iflag3 + 1; else, iflag3 = 0; end;
            
            err4 = abs(zk-root4);
            if err4 < 1.e-6, iflag4 = iflag4 + 1; else, iflag4 = 0; end;
            
        end;

        if iflag1 >= 4, M(j,i) = 1; end;
        if iflag2 >= 4, M(j,i) = 2; end;
        if iflag3 >= 4, M(j,i) = 3; end;
        if iflag4 >= 4, M(j,i) = 4; end;
        
    end;
end;

image([-1 1],[-1 1],M),
axis xy