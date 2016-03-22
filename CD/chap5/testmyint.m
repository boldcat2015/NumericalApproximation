% 2015.11.19 Newton-Cotes Residue
% Andy 2015-11-24
l = 500;
I = zeros(1,l+1);
for i = 1 : l+1
    I(i) = abs( exp(1) - 1 - myint(@exp, 0 , 1 , i-1 ));
    J(i) = abs( 2 - myint(@sin, 0 , pi , i-1 ));
    K(i) = abs( atan(5) - myint(@myf1, 0 , 1 , i-1 ));
    L(i) = abs( 1 - myint(@abs, -1 , 1 , i-1 ));
end
x = 0 : l;
semilogy(x , I , '*-', 'LineWidth', 2, 'Color', [1 0 0]);
hold on;
semilogy(x , J , 's-', 'LineWidth', 2, 'Color', [0 0 1]);
grid on;
semilogy(x , K , 'h-', 'LineWidth', 2, 'Color', [0 1 0]);
semilogy(x , L , 'o-', 'LineWidth', 2, 'Color', [1 0 1]);
legend('exp(x)', 'sin(x)', '1/(1+25*x^2)', 'abs(x)', 'Location', 'North');
