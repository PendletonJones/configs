#! /bin/bash
# note that you must put a space on either side of teh 
# brackets and you cannot just put them direclty adjacent. 
if [ "foo" == "foo" ]; then
	echo "foo = foo"
else
	echo "foo ne foo"
fi

# example of using variables in an if statement
VAR1 = 3
VAR2 = 4

if [ "VAR1$" == "VAR2$" ]; then 
    echo "they are equal"
else
    echo "not equal"
fi

# for loops
# iterate over a series of words in a string
for i in $( ls ) do
    echo item: $i
done

# `seq 1 10` -- in bash the text between backticks is executed and replaced with 
# the output. 
for i in `seq 1 10`; do
    echo $i
done

# while sample 
COUNTER=0
while [ $counter -lt 10 ]; do
    echo The counter is $COUNTER
    let COUNTER=COUNTER+1
done

# counter
COUNTER=20
until [ $COUNTER -lt 10 ]; do
    echo COUNTER $COUNTER
    let COUNTER-=1
done

# select is like for, but it prompts the user. 
# I guess it uses 
OPTIONS = "hello quit"
select opt in $OPTIONS; do
    if [ "$opt" = "quit" ]; then
	echo done
	exit
    elif [ "$opt" = "hello" ]; then
	echo Hello World
    else
	clear
	echo bad option
    fi
done

# read will prompt the user for input. 
echo Please, enter your name
read NAME
echo "hi $NAME"

# expression examples
echo $[1+1] 
echo $((1+1))

# the return value of a program is stored in a variable "$?"
cd /dada &> /dev/null
# change into a non-existant directory and redirect output to null
echo rv: $?
cd $(pwd) &> /dev/null
echo rv: $?
# the above commands 


# you can capture the output of a command by using those backticks. very useful. 
DBS=`mysql -uroot -e"show databases"`
for b in $DBS;
do
    msql -uroot -e"show tables from $b"
done

# string comparison 
=, !=
<, >
-n, -z # -n is not null, -z is null/zero-length
matches, does not match
s1 is not null
s1 is null

# useful commands
sed # strema editor, non interactive editor. you script instructions, plus the name of the file
awk # manipulation of data files, text retrieval and processing
	# scan for a pattern, on each match an action will be performed
grep # print lines matching a search pattern
wc 	# count lines, words, bytes
sort 	# sort lines of a text file
# note that you evaluate these using $, I think
bc # a calculator programming language. 
tput # move the prompt to a position, put something there, takes x and y parameters 


















