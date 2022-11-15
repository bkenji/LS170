# counter=0
# max=10

# until [ $counter -gt $max ]
# do 
#   echo $counter
#   ((counter++))
# done


counter=10
max=5

until [ $counter -lt $max ]
do
	echo $counter
	((counter--))
done