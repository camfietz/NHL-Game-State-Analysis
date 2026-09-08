function [p] = skellam(x, lambda1, lambda2)

g_list = [-3 -2 -1 0 1 2 3];

% PMF of Skellam distribution
pmf = zeros(size(g_list));

for i = 1 : length(g_list)
    k = g_list(i);
    pmf(i) = exp(-(lambda1 + lambda2)) * ((lambda1 / lambda2)^(k / 2)) * besseli(abs(k), 2 * sqrt(lambda1 * lambda2));
end

g_index = find(g_list == x);
p = pmf(g_index);