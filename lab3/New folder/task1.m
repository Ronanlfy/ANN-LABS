animals
w = rand(100,84);
step = 0.2;
neighbor = 50;
n = 21;
nei = 50;
for epoch = 1:n
  for ani = 1:32
   %find the closet nide
      x = repmat(props(ani,:),100,1);
      d =  (x - w)*(x - w)';
      d = diag(d);
      [dis,index] = min(d);
   %weight updating
     a = index - neighbor;
     b = index + neighbor;
     if(a <= 0)
         a = 1;
     end
      if(b > 100)
         b=100;
     end
     w(a:b,:) = w(a:b,:) + step*(x(a:b,:)-w(a:b,:));
  end
  neighbor = round(neighbor - nei/(n-1));
end
pos = zeros(1,32);
for ani = 1:32
   %find the closet nide
      x = repmat(props(ani,:),100,1);
      d =  (x - w)*(x - w)';
      d = diag(d);
      [dis,index] = min(d);
      pos(1,ani) = index;
end
[dummy order] = sort(pos);
snames(order)'

      