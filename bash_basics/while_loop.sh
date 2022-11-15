

counter=10
min=0


while [ $counter -ge $min ]
do
  echo $counter
  ((counter--))
done