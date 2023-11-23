
#!/bin/sh


for i in 0 1 2 3 5 6 7 8 9 10
do
echo "$i"
done


pair_impair() 
{ 
    test `expr $1 % 2` -eq 0 && return 0 || return 1 
} 

for i in 0 1 2 3 5 6 7 8 9 10
do
if pair_impair $i
then
echo "-"
else
echo "$i"
fi
done


