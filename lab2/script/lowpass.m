function output = lowpass(input, para, verbose)
if (nargin < 3)
    verbose = 0;
end
% % passband freq, stop band freq, passband ripple, stopband attenuation
% d = fdesign.lowpass('Fp,Fst,Ap,Ast', para(1), para(2), para(3), para(4));   
% Hd = design(d, 'equiripple');   
% output = filter(Hd, input);
% % fvtool(Hd)
% if verbose == 1
%     subplot(2,1,1)
%     plot(psd(spectrum.periodogram, input, 'Fs', 100))
%     subplot(2,1,2)
%     plot(psd(spectrum.periodogram, output, 'Fs', 100))
% end

output = filter(para, [1, (para-1)], input);

end
