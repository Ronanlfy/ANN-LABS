votes
[x,y] = meshgrid([1:10],[1:10]);
xpos = reshape(x,1,100);
ypos = reshape(y,1,100);
w = rand(100,31);
step = 0.2;
neighbor = 5;
nei = 5;
n = 200;
for epoch = 1:n
    neighbor = neighbor - floor(nei/n);
  for i = 1:349
   %find the closet nide
   input = vote(i,:);
   input = repmat(input,100,1);
      d =  (input - w)*(input - w)';
      d = diag(d);
      [dis,index] = min(d);
      xindex = xpos(index);
      yindex = ypos(index);
   %define the index
     right = yindex + neighbor;
     left = yindex - neighbor;
     down = xindex + neighbor;
     up = xindex - neighbor;
     if (left < 1)
         left = 1;
     end
     if (right > 10)
         right = 10;
     end
     if (up < 1)
         up = 1;
     end
     if (down > 10)
         down = 10;
     end
  %weight updating
  for xindex = up:1:down
      a = (xindex-1)*10 + left;
      b = (xindex-1)*10 + right;
    w(a:b,:) = w(a:b,:) + step*(input(a:b,:)-w(a:b,:));
  end
  end
end

pos = zeros(1,349);
for i = 1:349
   %find the closet nide
   input = vote(i,:);
   input = repmat(input,100,1);
      d =  (input - w)*(input - w)';
      d = diag(d);
      [dis,index] = min(d);
      pos(1,i) = index;
end

%display the result
a = ones(1,100)*350;
a(pos) = 1:349;


figure(1)
mppartys
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0]);
p = [mpparty;0];
image(p(reshape(a,10,10))+1);
colorbar;

figure(2)
mpsexes
colormap(parula(3));
p = [mpsex;0];
image(p(reshape(a,10,10))+1);
colorbar;

figure(3)
mpdistricts
colormap(parula(30));
p = [mpdistrict;0];
image(p(reshape(a,10,10))+1);
colorbar;


