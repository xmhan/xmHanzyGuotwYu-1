

function [kount, orbit] = test5(z)

phi = inline ('z^2 + 0.36 + 1i*0.1');

fixpt1 = 1/2+sqrt(-11/25-1i*2/5)/2;
fixpt2 = 1/2-sqrt(-11/25-1i*2/5)/2;

iflag1 = 0;
iflag2 = 0;
kount = 0;

zk = z;
orbit = ones(2000);

while kount < 2000 && abs(zk) <= 100 && iflag1 < 10 && iflag2 < 10
    kount = kount + 1;
    zk = phi(zk);
    orbit(kount) = zk;
    
    err1 = abs(zk-fixpt1);
    if err1 < 1.e-12, iflag1 = iflag1 + 1; else, iflag1 = 0; end;
            
    err2 = abs(zk-fixpt2);
    if err2 < 1.e-12, iflag2 = iflag2 + 1; else, iflag2 = 0; end;
end

if kount < 2000
    orbit = orbit(1:kount);
end

if abs(zk) > 100
    disp('Filled julia set is disconnected.');

elseif iflag1 >= 10 || iflag2 >= 10
    disp('Filled julia set is connected.');

else
    disp('The orbit does not reach the diverging modulus after 2000 iterations.'); 
    disp('We conclude that filled Julia set is connected.');
end

end