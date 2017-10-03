%% data of sin(2x)
patterns = (0 : 0.1 : 2*pi)';
targets = sin2x(patterns);

%% simple case given units
units = 5;
fun = 'sin2x';
eta = 0.5;
[m, var, Iter, F] = makerbf(patterns, units);
residual = diter(patterns, m, var, Iter, F, units, fun, eta, 0);

%% tests units for given residual value
while (1)
    if residual < 0.1
        residual = diter(patterns, m, var, Iter, F, units, fun, eta);
        break;
    end
    units = units + 1;
    [m, var, Iter, F] = makerbf(patterns, units);
    residual = diter(patterns, m, var, Iter, F, units, fun, eta, 0);
end