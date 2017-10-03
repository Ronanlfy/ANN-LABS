clear all
disp('task 7')
n = 100;
iteration = 400;
activity = 0.01;
    a = 1;

%generate sparse patterns
for theta = 0:0.1:4
         num = 0;
         x1 = 1;
         x = 1;
      while (x1 == x)
           num = num + 1;
           x = zeros(num,n);
           index = unidrnd(n,num,round(n * activity));
           for i = 1:num
               x(i,index(i,:)) = 1;
           end

           %compute weight
           w = (x - activity)' * (x - activity);
           x1 = x;
           %update
           for i = 1:iteration
                x = 0.5 + 0.5 * sgn(x * w - theta);
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
title('stored patterns under different theta with 10% activity');