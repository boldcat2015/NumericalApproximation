function [ final ] = sheru ( number , digit )
% 按有效数字四舍五入
% 2015.9.15
% usage : sheru ( target_number , valuable_digit_number )
tmp = sprintf ( '%%.%de' , digit - 1 );
final = str2num ( sprintf ( tmp , number ));
end
