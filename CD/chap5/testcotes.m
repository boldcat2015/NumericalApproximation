% 2015.11.19 Newton-Cotes R
% Andy 2015-11-22

%% Cotes coefficients c(n,k) = a(n,k) / b(n)
a = [[1, 1, 0, 0, 0, 0, 0, 0, 0];...
     [1, 4, 1, 0, 0, 0, 0, 0, 0];...
     [1, 3, 3, 1, 0, 0, 0, 0, 0];...
     [7, 32, 12, 32, 7, 0, 0, 0, 0];...
     [19, 75, 50, 50, 75, 19, 0, 0, 0];...
     [41, 216, 27, 272, 27, 216, 41, 0, 0];...
     [751, 3577, 1323, 2989, 2989, 1323, 3577, 751, 0];...
     [989, 5888, -928, 10496, -4540, 10496, -928, 5888, 989]];
b = [2, 6, 8, 90, 288, 840, 17280, 28350];

ii = abs( exp(1) - 1 - exp(0.5));
I = zeros(1,8); % store I = I(f-pn)
%% f(x) = exp(x), 0 <= x <= 1, I(f) = e-1
for i = 1 : 8
    for j = 1 : i + 1
        I(i) = I(i) + a(i,j)/b(i) * exp((j-1)/i);
    end
    I(i) = abs( exp(1) - 1 - I(i) );
end

jj = abs( 2 - pi );
J = zeros(1,8); % store J = I(g-pn)
%% g(x) = sin(x), 0 <= x <= pi, I(g) = 2
for i = 1 : 8
    for j = 1 : i + 1
        J(i) = J(i) + a(i,j)/b(i) * sin((j-1)/i*pi);
    end
    J(i) = abs( 2 - J(i) * pi );
end

%% display
disp(sprintf('\nexp(x):'));
disp(sprintf(' 0 |%9.2e', ii));
for i = 1 : 8
    disp(sprintf(' %d |%9.2e', i, I(i)));
end
disp(sprintf('\nsin(x):'));
disp(sprintf(' 0 |%9.2e', jj));
for i = 1 : 8
    disp(sprintf(' %d |%9.2e', i, J(i)));
end

x = 0 : 8;
semilogy(x , [ii I], '*-', 'LineWidth', 2, 'Color', [0.9 0.1 0]);
hold on;
semilogy(x , [jj J], '*-', 'LineWidth', 2, 'Color', [.3 .2 1]);
grid on;
legend('exp(x)', 'sin(x)', 'Location', 'South');
