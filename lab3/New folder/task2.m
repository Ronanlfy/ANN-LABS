cities
w = rand(10,2);
step = 0.2;
neighbor = 2;
n = 1000;
for epoch = 1:n
  for i = 1:10
   %find the closet node
   x = city(i,:);
   x = repmat(x,10,1);
      d =  (x - w)*(x - w)';
      d = diag(d);
      [dis,index] = min(d);
   %weight updating
     a = index - neighbor;
     b = index + neighbor;
     if((a > 0)&&(b < 11))
      w(a:b,:) = w(a:b,:) + step*(x(a:b,:)-w(a:b,:));
     end
     if(a <= 0)
       w(1:b,:) = w(1:b,:) + step*(x(1:b,:)-w(1:b,:)); 
       w(10+a:10,:) = w(10+a:10,:) + step*(x(10+a:10,:)-w(10+a:10,:)); 
     end
      if(b > 10)
          b = b - 10;
        w(a:10,:) = w(a:10,:) + step*(x(a:10,:)-w(a:10,:)); 
        w(1:b,:) = w(1:b,:) + step*(x(1:b,:)-w(1:b,:)); 
      end
  end
  if(epoch < n/3)
  neighbor = 0;
  end
   if((epoch > (n/3))&&(epoch < (2*n/3)))
  neighbor = 1;
  end
end
pos = zeros(1,10);
for i = 1:10
   %find the closet nide
      x = repmat(city(i,:),10,1);
      d =  (x - w)*(x - w)';
      d = diag(d);
      [dis,index] = min(d);
      pos(1,i) = index;
end

[dummy order] = sort(pos);
order(end+1) = order(1);

tour = [w;w(1,:)];
plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'+')
title('cyclic tour')
xlabel('x')
ylabel('y')
hold on
plot(city(order,1),city(order,2),'r')



      
