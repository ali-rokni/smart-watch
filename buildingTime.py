f = open('data.txt', 'r')
target = open('time.txt','w')
data = f.readlines()
i=0
size = len(data)
second = []
minute = []
hour = []

for num in data:
    if i==0:
        second.append(0)
        minute.append(0)
        hour.append(0)
    else:
        print(i)
        print(int(num)//1000)
        
        second.append(int(num)//1000)
        if second[i] > 60:
            minute[i] = second[i]//60
            if minute[i] >60:
                hour[i] = minute[i]//60
                minute[i] = minute[i]%60
            second[i] = second[i]%60
    target.write(str(hour[i]))
    target.write("\t")
    target.write(str(hour[i]))
    target.write("\t")
    target.write(str(hour[i]))
    target.write("\t")
    i=i+1


    
