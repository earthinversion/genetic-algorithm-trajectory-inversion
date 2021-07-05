function y = channel(x, params) 

a = params(1); b = params(2); c = params(3);
for index=1:length(x)
    if x(index)<=a
        y(index)=0;
    elseif (x(index) >= a) && (x(index) <= b)
        y(index)=(x(index)-a)/(a-b);
    elseif (x(index) >= b) && (x(index) < c)
        y(index)=-1;
    elseif (x(index) >= c)
        y(index)=0;
    end
end
