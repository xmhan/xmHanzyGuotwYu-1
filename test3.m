c = 0;

hold on;

for j = 1:301
    y = -1.5 + (j-1) * 0.01;
    
    for i = 1:201
        x = -1 + (i-1) * 0.01;
        z = x + 1i*y;
        zk = z;
        kount = 0;
        
        while kount < 100
            r = sqrt((real(zk)-real(c))^2 + (imag(zk)-imag(c))^2);
            
            if (real(zk) - real(c)) > 0
                angle = atan(((imag(zk)-imag(c)) / (real(zk)-real(c))));
            end
            
            if (real(zk) - real(c)) < 0
                angle = atan(((imag(zk)-imag(c)) / (real(zk)-real(c)))) + pi;
            end

            sign = randi(2);
            if sign == 2
                sign = -1;
            end

            zk = sign * sqrt(r)*(cos(angle/2) + 1i*sin(angle/2));
            kount = kount + 1;
        end

        plot(real(zk),imag(zk),'--* r');
    end
end

hold off;