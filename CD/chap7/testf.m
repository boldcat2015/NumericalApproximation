function y = testf ( x )
%y = (x - 2) .^ 9 ;
y=0;
for i = 0 : 9
    y = y + nchoosek(9,i) * x .^ i * (-2) .^ (9-i);
end
return ;
