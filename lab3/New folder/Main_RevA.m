close all;
clear all;
clc;

%% Animals
disp('Animals:');
clear all;
animals;
w = rand(100, size(props, 2));
for epoch = 1 : 25
    eta = 0.2 * exp(-(epoch-1)/5);
    eta_epoch(epoch) = eta;
    nb = round(62 * exp(-epoch/4)); % size of neighbourhood
    nb_epoch(epoch) = nb;
    for a = 1 : size(props, 1)
        x = props(a, :);
        for id = 1 : size(w, 1)
            err = x - w(id, :);
            d(id, 1) = err * err';
        end
        [min_d, min_d_index] = min(d);
        nb_lower = min_d_index - nb;
        nb_upper = min_d_index + nb;
        if nb_lower < 1
            nb_lower = 1;
        end
        if nb_upper > size(w, 1)
            nb_upper = size(w, 1);
        end
        for inb = nb_lower : nb_upper
            w(inb, :) = w(inb, :) + eta * (x - w(inb, :));
        end
    end
end

disp(['eta = ', num2str(eta)]);
disp(['epoch = ', num2str(epoch)]);
for a = 1 : size(props, 1)
    x = props(a, :);
    for id = 1 : size(w, 1)
        err = x - w(id, :);
        d(id, 1) = err * err';
    end    
    [min_d, min_d_index] = min(d);
    pos(a, 1) = min_d_index;
end
[dummy, order] = sort(pos);
snames(order)'

figure(1);
subplot(1, 2, 1);
plot(1:size(nb_epoch, 2), nb_epoch);
title('Animals     Size of Neighborhood  v.s Epoch');
xlabel('Epoch');
ylabel('Size of Neighborhood');
grid on;
subplot(1, 2, 2);
plot(1:size(eta_epoch, 2), eta_epoch);
title('Animals     Learning Rate  v.s Epoch');
xlabel('Epoch');
ylabel('Learning Rate');
grid on;

for ii = 1 : 100
    kk = find(pos == ii);
    num_w(ii, 1) = size(kk, 1);
end

figure(2);
bar(1:100, num_w);
title('Animals     Number of Amimals in the Weight Space');
xlabel('Weights');
ylabel('Number of Amimals');
grid on;

%% Cyclic Tour
disp('Cyclic Tour');
clear all;
cities;
w = rand(size(city, 1), size(city, 2));
eta = 0.1;
for epoch = 1 : 50
    nb = round(2.5 * exp(-epoch/15));
    nb_epoch(epoch) = nb;
    for c = 1 : size(city, 1)
        x = city(c, :);
        for id = 1 : size(w, 1)
            err = x - w(id, :);
            d(id, 1) = err * err';
        end
        [min_d, min_d_index] = min(d);
        nb_lower = min_d_index - nb;
        nb_upper = min_d_index + nb;
        for inb = nb_lower : nb_upper
            if inb < 1
                inbc = inb + size(w, 1);
            elseif inb > size(w, 1)
                inbc = inb - size(w, 1);
            else
                inbc = inb;
            end
            w(inbc, :) = w(inbc, :) + eta * (x - w(inbc, :));
        end
    end
end

figure(3);
plot(1:size(nb_epoch, 2), nb_epoch);
title('Cyclic Tour     Size of Neighborhood  v.s Epoch');
xlabel('Epoch');
ylabel('Size of Neighborhood');
grid on;

for c = 1 : size(city, 1)
    x = city(c, :);
    for id = 1 : size(w, 1)
        err = x - w(id, :);
        d(id, 1) = err * err';
    end    
    [min_d, min_d_index] = min(d);
    pos(c, 1) = min_d_index;
end
[dummy, order] = sort(pos);
order'

tour = [w; w(1, :)];
figure(4);
plot(tour(:, 1), tour(:, 2), 'b-*', city(:, 1), city(:, 2), 'r+');
title(['Cyclic Tour', '  (eta = ', num2str(eta), ')']);
axis equal;
xlabel('x');
ylabel('y');
hold on;
order(end+1) = order(1);
plot(city(order, 1), city(order, 2), 'g');
hold off;

%% Votes of MPs
disp('Votes of MPs');
clear all;
votes;
mppartys;
mpsexes;
mpdistricts;
w = rand(10*10, size(vote, 2));
[x, y] = meshgrid([1:10], [1:10]);
xpos = reshape(x, 1, 100);
ypos = reshape(y, 1, 100);
for epoch = 1 : 200
    eta = 0.2 * exp(-(epoch-1)/200);
    eta_epoch(epoch) = eta;
    nb = round(6 * exp(-epoch/80));
    nb_epoch(epoch) = nb;
    for v = 1 : size(vote, 1)
        s = vote(v, :);
        for id = 1 : size(w, 1)
            err = s - w(id, :);
            d(id, 1) = err * err';
        end
        [min_d, winner] = min(d);
        winner_x = xpos(winner);
        winner_y = ypos(winner);
        nb_left = winner_y - nb;
        nb_right = winner_y + nb;
        nb_up = winner_x - nb;
        nb_down = winner_x + nb;
        if nb_left < 1
            nb_left = 1;
        end
        if nb_right > 10
            nb_right = 10;
        end
        if nb_up < 1
            nb_up = 1;
        end
        if nb_down > 10
            nb_down = 10;
        end
        for inbx = nb_up : nb_down
            for inby = nb_left : nb_right
                w(((inbx-1)*10+inby), :) = w(((inbx-1)*10+inby), :) + ...
                    eta * (s - w(((inbx-1)*10+inby), :));
            end
        end
    end
end

figure(5);
subplot(1, 2, 1);
plot(1:size(nb_epoch, 2), nb_epoch);
title('Votes of MPs     Size of Neighborhood  v.s Epoch');
xlabel('Epoch');
ylabel('Size of Neighborhood');
grid on;
subplot(1, 2, 2);
plot(1:size(eta_epoch, 2), eta_epoch);
title('Votes of MPs    Learning Rate  v.s Epoch');
xlabel('Epoch');
ylabel('Learning Rate');
grid on;

for v = 1 : size(vote, 1)
    s = vote(v, :);
    for id = 1 : size(w, 1)
        err = s - w(id, :);
        d(id, 1) = err * err';
    end    
    [min_d, winner] = min(d);
    pos(v, 1) = winner;
end

a = ones(1, 100) * 350;
a(pos) = 1 : 349;

figure(6);
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0]);
pp = [mpparty; 0];
aap = pp(reshape(a, 10, 10));
image(aap + 1);
colorbar;
title(['Votes of MPs - Party']);
xlabel('x');
ylabel('y');

figure(7);
colormap(parula(3));
ps = [mpsex; 0];
aas = ps(reshape(a, 10, 10));
image(aas + 1);
colorbar;
title(['Votes of MPs - Gender']);
xlabel('x');
ylabel('y');

figure(8);
colormap(parula(30));
pd = [mpdistrict; 0];
aad = pd(reshape(a, 10, 10));
image(aad + 1);
colorbar;
title(['Votes of MPs - District']);
xlabel('x');
ylabel('y');

for ii = 1 : 100
    kk = find(pos == ii);
    num_w(ii, 1) = size(kk, 1);
end
figure(9);
bar(1:100, num_w);
title('Votes of MPs     Number of MPs in the Weight Space');
xlabel('nodes index');
ylabel('Number of MPS');
grid on;

for ii = 1 : 100
    num_w_3dbar(xpos(ii), ypos(ii)) = num_w(ii, 1);
end
figure(10);
bar3(num_w_3dbar);


