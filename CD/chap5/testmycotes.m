% 2015.11.19 Newton-Cotes R
% Andy 2015-11-22
l = 20;
ii = abs( exp(1) - 1 - exp(0.5));
I = zeros(1,l); % store I = I(f-pn)
%% f(x) = exp(x), 0 <= x <= 1, I(f) = e-1
for i = 1 : l
    I(i) = exp([0:i]/i) * cotes(i);
    I(i) = abs( exp(1) - 1 - I(i) );
end

jj = abs( 2 - pi );
J = zeros(1,l); % store J = I(g-pn)
%% g(x) = sin(x), 0 <= x <= pi, I(g) = 2
for i = 1 : l
    J(i) = sin([0:i]/i*pi) * cotes(i);
    J(i) = abs( 2 - J(i) * pi );
end

M = zeros(1,l); % store M = I(s-pn)
%% s(x) = 1/(1+25*x^2), 0 <= x <= 1, I(s) = atan(5)
for i = 1 : l
    M(i) = 1 ./ (1 + 25 .* ([0:i]./i) .^2 ) * cotes(i);
    M(i) = abs( atan(5) - M(i) )
end

N = zeros(1,l); % store N = I(t-pn)
%% t(x) = abs(x), -1 <= x <= 1, I(s) = 1
for i = 1 : l
    N(i) = abs(2.*[0:i]-1) * cotes(i);
    N(i) = abs( 1 - N(i) )
end

x = 0 : l;
semilogy(x , [ii I], '*-', 'LineWidth', 2, 'Color', [0.9 0.1 0]);
hold on;
semilogy(x , [jj J], '*-', 'LineWidth', 2, 'Color', [.3 .2 1]);
grid on;
semilogy(x , [jj M], '*-', 'LineWidth', 2, 'Color', [0 1 0]);
semilogy(x , [jj N], '*-', 'LineWidth', 2, 'Color', [0 0 0]);
legend('exp(x)', 'sin(x)', '1/(1+25*x^2)', 'abs(x)', 'Location', 'South');
