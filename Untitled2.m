y=144
j=1
x=y-48
while j<=x 
    traind_ind(j) = 1
    test_ind(j) = 0
    j=j+1;
end
 while j<=y 
    traind_ind(j) = 0
    test_ind(j) = 1
    j=j+1;
end