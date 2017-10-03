clear;
fundata;
input = patterns;
output = targets;
epochs = 100;
eta = 0.05;
alpha = 0.9;
hidden = 10;
W = rand(hidden, size(input, 1) + 1);
V = rand(size(output, 1), hidden + 1);
dW = zeros(size(W));
dV = zeros(size(V));
error = zeros(1, epochs);

for i = 1 : epochs
    [Hout, Out] = fwdpass(input, W, V);
    [delta_o, delta_h] = backpass(output, Hout, Out, V);
    [W, V, dW, dV] = w_update(input, Hout, delta_h, delta_o, W, V,...
        dW, dV, alpha, eta);
    error(i) = sum(sum(abs(Out - output)));
    
    % plot
    zz = reshape(Out, 11, 11);
    mesh(x, y, zz);
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;
%     pause;
end

figure()
plot(1 : epochs, error, 'r-o');
xlabel('epochs');
ylabel('error');