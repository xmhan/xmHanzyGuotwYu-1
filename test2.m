phi = inline('z^2-0.123-1i*0.745');
c = -0.123-1i*0.745;
fixpt1 = 1/2+sqrt(1+4*c)/2;
fixpt2 = 1/2-sqrt(1-4*c)/2;

colormap([1 0 0; 1 1 1]);

M = 2*ones(301,301);

for j = 1:301
    y = -1.5 + (j-1)*0.01;
    for i = 1:301
        x = -1.5 + (i-1)*0.01;
        z = x + 1i*y;
        zk = z;
        iflag1 = 0;
        iflag2 = 0;
        kount = 0;
        
        while kount < 100 && abs(zk) < 2 && iflag1 < 5 && iflag2 < 5
            kount = kount + 1;
            zk = phi(zk);
            
            err1 = abs(zk-fixpt1);
            if err1 < 1.e-6, iflag1 = iflag1 + 1; else, iflag1 = 0; end;
            
            err2 = abs(zk-fixpt2);
            if err2 < 1.e-6, iflag2 = iflag2 + 1; else, iflag2 = 0; end;
        end;
        
        if iflag1 >= 5 || iflag2 >= 5 || kount >= 100
            M(j,i) = 1;
        end;
        
    end;
end;

image([-1.5 1.5],[-1.5 1.5],M),
axis xy