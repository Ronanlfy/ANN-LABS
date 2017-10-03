clear all;
clc;

%task 1
disp('Taks 1');
x1 = vm([0 0 1 0 1 0 0 1]);
x2 = vm([0 0 0 0 0 1 0 0]);
x3 = vm([0 1 1 0 0 1 0 1]);
n = length(x1);
x = [x1;x2;x3];

w = x' * x;
%update
x1 = sgn(x * w);
disp('update_x - x :');
x1-x

%task 2
disp('Taks 2');
xd1 = vm([1 0 1 0 1 0 0 1]);
xd2 = vm([1 1 0 0 0 1 0 0]);
xd3 = vm([1 1 1 0 1 1 0 1]);

xd = [xd1;xd2;xd3];
iteration = 10;
a = 0;

for i = 1:iteration
    xd_new = xd;
    xd = sgn(xd * w);
    a = a + 1;
    if (xd_new == xd)
        break;
    end
end
disp('iteration times:')
a


if (xd==x)
    disp('patterns can converge towards stored patterns');
else
    disp('patterns can not converge towards stored patterns');
end

%task 3
disp('task 3');
pict
w = p1' * p1 + p2' * p2 + p3' * p3;

iteration = 9000;
p = p11;

for i = 1:iteration
    p_new = p;
    m = unidrnd(length(p));
    p(m) = sgn(p * w(:,m));
    %compute energy
    E(1,i) = -p*w*p';
    iter(1,i) = i;
end

figure(2)
subplot(1,3,1)
vis(p1)
title('orginal pattern P1');
subplot(1,3,2)
vis(p11)
title('input pattern P11');
subplot(1,3,3)
vis(p)
title('output pattern after 9000 iterations using sequential update');

figure(3)
plot(iter,E)
title('energy for p11');
xlabel('iterations');
ylabel('energy');


p = p22;


for i = 1:iteration
    p_new = p;
    m = unidrnd(length(p));
    p(m) = sgn(p * w(:,m));
    %compute energy
    E(1,i) = -p*w*p';
    iter(1,i) = i;
end

figure(4)
subplot(2,2,1)
vis(p2)
title('orginal pattern P2');
subplot(2,2,2)
vis(p3)
title('orginal pattern P3');
subplot(2,2,3)
vis(p22)
title('input pattern P22');
subplot(2,2,4)
vis(p)
title('output pattern after 9000 iterations using sequential update');

figure(5)
plot(iter,E)
title('energy for p22');
xlabel('iterations');
ylabel('energy');

%task 4 random weight
clear all
disp('task 4');
pict
w = randn(length(p1));
w = 0.5 * (w + w');

iteration = 6000;
%p = vm(randint(1,length(p1),[0 1]));
p = p11;
p1 = p;

for i = 1:iteration
    m = unidrnd(length(p));
    p(m) = sgn(p * w(:,m));
    %compute energy
    E(1,i) = -p*w*p';
    iter(1,i) = i;
end

figure(6)
subplot(1,2,1)
vis(p1)
subplot(1,2,2)
vis(p)

figure(7)
plot(iter,E)
title('energy for random')
xlabel('iterations');
ylabel('energy');


%task 5 distortion
clear all
disp('task 5')
pict
w = p1' * p1 + p2' * p2 + p3' * p3;

iteration = 500;
n = length(p1);
a = 1;

for rate = 0:0.01:1
    p = flip(p1,round(n*rate));
    po = p;
    
    for i = 1:iteration
    p = sgn(p * w);
    end
    
    m(a) = length(find(p1 ~= p));
    r(a) = rate;
        a = a + 1;
  
end

figure(6)
plot(r,m)
title('mistakes for distortion noise after 5000 iterations')
xlabel('noise rate')
ylabel('number of mistakes')

%taks 7 sparse patterns
clear all
disp('task 7')
n = 100;
iteration = 400;
activity = 0.01;
    a = 1;

%generate sparse patterns
for theta = 0:0.1:10
         num = 0;
         x1 = 1;
         x0 =1;
      while (x1 == x0)
           num = num + 1;
           x = zeros(num,n);
           index = unidrnd(n,num,round(n * activity));
           for i = 1:num
               x(i,index(i,:)) = 1;
           end

           %compute weight
           w = (x - activity)' * (x - activity);
           x1 = x;
           x0 = x1;
           %update
           for i = 1:iteration
                x1 = 0.5 + 0.5 * sgn(x1 * w - theta);
           end
      end
      NU(a) = num - 1;
      THE(a) = theta;
      a = a + 1;
end

figure(7)
plot(THE,NU)
xlabel('theta');
ylabel('number of stored patterns');
title('stored patterns under different theta with 1% activity');












