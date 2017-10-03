close all;
clear all;
clc;

global m;
global var;
global w;

% %% Batch Mode Training using Least Squares for sin(2x)
% patterns = (0 : 0.1 : 2*pi)';
% targets = sin2x(patterns);
% 
% units = 5;
% [m, var] = makerbf(patterns, units);  % Get center position and variance
% Phi = calcPhi(patterns, m, var);
% w = (Phi' * Phi)\(Phi' * targets);
% y = Phi * w;
% figure(1);
% rbfplot1(patterns, y, targets, units);
% 
% units = 6;
% [m, var] = makerbf(patterns, units);  % Get center position and variance
% Phi = calcPhi(patterns, m, var);
% w = (Phi' * Phi)\(Phi' * targets);
% y = Phi * w;
% figure(2);
% rbfplot1(patterns, y, targets, units);
% 
% % tests units for given residual value 0.1, 0.01 and 0.001
% while (max(abs(targets - y)) >= 0.1)
%     units = units + 1;
%     if units > 100
%         break;
%     end
%     [m, var] = makerbf(patterns, units);
%     Phi = calcPhi(patterns, m, var);
%     w = (Phi' * Phi) \ (Phi' * targets);
%     y = Phi*w;
%     figure(3);
%     rbfplot1(patterns, y, targets, units);
% end
% 
% % tests units for given residual value 0.1, 0.01 and 0.001
% while (max(abs(targets - y)) >= 0.01)
%     units = units + 1;
%     if units > 100
%         break;
%     end
%     [m, var] = makerbf(patterns, units);
%     Phi = calcPhi(patterns, m, var);
%     w = (Phi' * Phi) \ (Phi' * targets);
%     y = Phi*w;
%     figure(4);
%     rbfplot1(patterns, y, targets, units);
% end
% 
% % tests units for given residual value 0.1, 0.01 and 0.001
% while (max(abs(targets - y)) >= 0.001)
%     units = units + 1;
%     if units > 100
%         break;
%     end
%     [m, var] = makerbf(patterns, units);
%     Phi = calcPhi(patterns, m, var);
%     w = (Phi' * Phi) \ (Phi' * targets);
%     y = Phi*w;
%     figure(5);
%     rbfplot1(patterns, y, targets, units);
% end
% 
% 
% %% Batch Mode Training using Least Squares for square(2x)
% patterns = (0 : 0.1 : 2*pi)';
% targets = square(2 * patterns);
% 
% units = 5;
% [m, var] = makerbf(patterns, units);  % Get center position and variance
% Phi = calcPhi(patterns, m, var);
% w = (Phi' * Phi)\(Phi' * targets);
% y = Phi * w;
% figure(6);
% rbfplot1(patterns, y, targets, units);
% 
% units = 6;
% [m, var] = makerbf(patterns, units);  % Get center position and variance
% Phi = calcPhi(patterns, m, var);
% w = (Phi' * Phi)\(Phi' * targets);
% y = Phi * w;
% figure(7);
% rbfplot1(patterns, y, targets, units);
% 
% % tests units for given residual value 0.1, 0.01 and 0.001
% while (max(abs(targets - y)) >= 0.1)
%     units = units + 1;
%     if units > 100
%         break;
%     end
%     [m, var] = makerbf(patterns, units);
%     Phi = calcPhi(patterns, m, var);
%     w = (Phi' * Phi) \ (Phi' * targets);
%     y = Phi*w;
%     figure(8);
%     rbfplot1(patterns, y, targets, units);
% end
% 
% % tests units for given residual value 0.1, 0.01 and 0.001
% while (max(abs(targets - y)) >= 0.01)
%     units = units + 1;
%     if units > 100
%         break;
%     end
%     [m, var] = makerbf(patterns, units);
%     Phi = calcPhi(patterns, m, var);
%     w = (Phi' * Phi) \ (Phi' * targets);
%     y = Phi*w;
%     figure(9);
%     rbfplot1(patterns, y, targets, units);
% end
% 
% % tests units for given residual value 0.1, 0.01 and 0.001
% while (max(abs(targets - y)) >= 0.001)
%     units = units + 1;
%     if units > 100
%         break;
%     end
%     [m, var] = makerbf(patterns, units);
%     Phi = calcPhi(patterns, m, var);
%     w = (Phi' * Phi) \ (Phi' * targets);
%     y = Phi*w;
%     figure(10);
%     rbfplot1(patterns, y, targets, units);
% end

% %% Online Training using the Delta Rule for sin(2x)
% patterns = (0 : 0.1 : 2*pi)';
% targets = sin2x(patterns);
% 
% units = 5;
% fun = 'sin2x';
% eta = 0.5;
% [m, var, fmin, fmax] = makerbf(patterns, units);
% iter = 0;
% itersub = 20;		% subsampling
% itermax = 2000;		% # iterations per call to diter (multiple of itersub)
% eta = 0.5;		% used by others
% figure(11);
% res = diter(patterns, m, var, iter, itersub, itermax, fmin, fmax, units, fun, eta, 0);
% 
% 
% % tests units for given residual value
% figure(12);
% while (res >= 0.1)
%     units = units + 1;
%     if units > 100
%         break;
%     end
% %     eta = res * 0.5;
%     [m, var, Iter, F] = makerbf(patterns, units);
%     res = diter(patterns, m, var, iter, itersub, itermax, fmin, fmax, units, fun, eta, 0);
% end


% %% RBF Placement by Self Organization using CL Algorithm
% data = read('cluster');
% units = 5;
% 
% figure(13);
% vqinit;
% singlewinner = 1;   % 1: winner-take-all, 0: all to move
% % while(1)
% %     m0 = m;
% %     var0 = var;
% %     vqstep;
% %     if (max(max(abs(m - m0))) <= 5*10^-3 && max(max(abs(var - var0))) <= 5*10^-3)
% %         break;
% %     end
% %     pause;
% % end
% % animation
% vqiter;
% 
% figure(14);
% singlewinner = 0;   % 1: winner-take-all, 0: all to move
% % while(1)
% %     m0 = m;
% %     var0 = var;
% %     vqstep;
% %     if (max(max(abs(m - m0))) <= 5*10^-3 && max(max(abs(var - var0))) <= 5*10^-3)
% %         break;
% %     end
% %     pause;
% % end
% % animation
% vqiter;


% %% RBF Placement by Self Organization using EM Algorithm
% data = read('cluster');
% units = 5;
% vqinit;
% 
% figure(15);
% singlewinner = 1;   % 1: winner-take-all, 0: all to move
% emiterb;
% 
% figure(16);
% singlewinner = 0;   % 1: winner-take-all, 0: all to move
% emiterb;




%% Function Approximation for Noisy Data without Lowpass Filter
% initial
[xtrain ytrain] = readxy('ballist', 2, 2);
[xtest ytest] = readxy('balltest', 2, 2);

% Low Pass Filter Test
% xx = xtrain(:, 1);
% tt = 1 : 1 : size(xx, 1);
% figure(20);
% plot(tt, xx, 'b');
% hold on;
% a = 1;
% num = [(a/2)/(1+a/2) (a/2)/(1+a/2)];
% den = [1 (a/2 - 1)/(a/2 + 1)];
% xx_filtered = filter(num, den, xx);
% plot(tt, xx_filtered, 'r');
% hold off;

LOWPASS = 0;
units = 20;
singlewinner = 1;
limx = [-0.5 1.5];
limy = [-0.5 1.5];
data = xtrain;

vqinit;
emiterb

% calculate matrix phi
Phi = calcPhi(xtrain, m, var);
d1 = ytrain(:, 1); 
d2 = ytrain(:, 2);
dtest1 = ytest(:, 1);
dtest2 = ytest(:, 2);

% calculate weight and approximation
w1 = Phi\d1;
w2 = Phi\d2;

% approximation of training data
y1 = Phi*w1;
y2 = Phi*w2;

% approximation of test data
Phitest = calcPhi(xtest,m,var);
ytest1 = Phitest*w1;
ytest2 = Phitest*w2;

figure(17);
subplot(2, 2, 1)
xyplot(d1,y1,'train1');
subplot(2, 2, 2)
xyplot(d2,y2,'train2');
subplot(2, 2, 3)
xyplot(dtest1,ytest1,'test1');
subplot(2, 2, 4)
xyplot(dtest2,ytest2,'test2');


%% Function Approximation for Noisy Data with Lowpass Filter
% initial
[xtrain ytrain] = readxy('ballist', 2, 2);
[xtest ytest] = readxy('balltest', 2, 2);

LOWPASS = 1;
units = 20;
singlewinner = 1;
limx = [-0.5 1.5];
limy = [-0.5 1.5];

% lowpass input during training
if LOWPASS == 1
    a = 100;
    num = [(a/2)/(1+a/2) (a/2)/(1+a/2)];
    den = [1 (a/2 - 1)/(a/2 + 1)];
    ytrain_low = filter(num, den, ytrain);
    xtrain_low = xtrain;
    data = xtrain_low;
else
    data = xtrain;
end

vqinit;
emiterb

% calculate matrix phi
Phi = calcPhi(xtrain, m, var);
if LOWPASS == 1
    d1 = ytrain_low(:, 1);
    d2 = ytrain_low(:, 2);
else
    d1 = ytrain(:, 1); 
    d2 = ytrain(:, 2);
end
dtest1 = ytest(:, 1);
dtest2 = ytest(:, 2);

% calculate weight and approximation
w1 = Phi\d1;
w2 = Phi\d2;

% approximation of training data
y1 = Phi*w1;
y2 = Phi*w2;

% approximation of test data
Phitest = calcPhi(xtest,m,var);
ytest1 = Phitest*w1;
ytest2 = Phitest*w2;

figure(18);
subplot(2, 2, 1)
xyplot(d1,y1,'train1');
subplot(2, 2, 2)
xyplot(d2,y2,'train2');
subplot(2, 2, 3)
xyplot(dtest1,ytest1,'test1');
subplot(2, 2, 4)
xyplot(dtest2,ytest2,'test2');



