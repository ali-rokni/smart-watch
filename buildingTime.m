load data.txt;

[m,n] = size(data);
second = zeros(m,n);
minute = zeros(m,n);
hour = zeros(m,n);
for i=1:m
    if i==1
        second(i,1)=0;
        minute(i,1)=0;
        hour(i,1)=0;
    else
        
        second(i,1)=idivide(data(i,1),1000);
        if second(i,1) > 60
            minute(i,1) = idivide(second(i,1),60);
            if minute(i,1) >60
                hour(i,1) = idivide(minute(i,1),60);
                minute(i,1) = minute(i,1);
            end
            second(i,1) = mod(second(i,1),60);
        end
    end
end