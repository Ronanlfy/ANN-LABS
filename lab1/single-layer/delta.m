function W = delta(input, output)
epochs = 20;
eta = 0.01;  %step length
PAUSE = 1;
input = [input; ones(1, size(input, 2))];   % input comes from sepdata,3*100
W = rand(1, 3);      %initial weight matrix
axis ([-2, 2, -2, 2], 'square');

for i = 1 : epochs
    dW = - eta * (W * input - output) * input'; 
    W = W + dW;
    
    % plot the separation line
    p = W(1, 1 : 2);
    k = - W(1, 3) / (p * p');
    l = sqrt(p * p');
    plot(input(1, find(output > 0)), ...
        input(2, find(output > 0)), '*', ...
        input(1, find(output < 0)), ...
        input(2, find(output < 0)), '+', ...
        [p(1), p(1)] * k + [-p(2), p(2)] / l, ...
        [p(2), p(2)] * k + [p(1), -p(1)] / l, '-');
    axis ([-2, 2, -2, 2], 'square');
    title('single layer   dataset = nsepdata   eta = 0.01');
    drawnow;
    
%     axis ([-2, 2, -2, 2], 'square');
    if PAUSE == 1
        pause;
    end
end

end