
pwd = print working directory
ls = list
ls -a = list all
mv = to move files, replace and rename files
Bash works using
REPL = Read Eval Print loop
Read first, then Evaluates, at last prints the output

cat = view contents inside a file
rm = will remove the file
rm -i = will interactively confirm each file before deleting
history = to view the history of commands typed

use '' to use with special characters
'dave' = use the special characters for searching 
'^dave = will match the first starting of the word
'dave$' = will match the ending of the word
'da.' = this '.' dot will match any one character after the input specified
touch = this will create a new file
echo = this will print the thing to screen
example : echo hello = will print hello to the screen
cat = to view contents inside a file

echo hello > = this ">" symbol is used to redirect the output to file
echo hello >> = this ">>" symbol will append the output to file

grep = search for input letter from a file or output
example : grep a = will search for a in the output

grep -A1 = output search term and one line after search term
grep -B1 = output search term and one line below the search term
grep -C1 = output context of the search term (i.e : one line above and below the search term)
grep -i = output without using case sensitive (i.e : i uses case insensitive)
grep -o = only output the match part 
example : grep -o da file.txt ; If the file.txt contains dave. it will only output da from the file.txt


"|" = this symbol is pipe line, this pipe the output to another command
example : cat file.txt | grep a = output any word that has small 'a' in it

less = this command is super useful to view the document page by page
example : less usr/share/dict/words = this command opens the output in pager, press up/down arrow to view scroll and press q to quit from the page
there is a command mode just like vim in pager
press / to use pager command mode; type out the word to find the word
press n to go to the next word and shift n to go to the previous word
 
there is another command more which is will be more or less the same like less.

man {command} = this opens manual for the command input pager 
example : man ls = opens manual for ls command in pager
man is very useful to see the manual of external commands

man equivalent of system command is help
help history = this will display the manual page of history

to find out whether a command is external/system one, we use type
type ls = this is output whether type is system one or external command if it is external it will display its path
type -a ls = this is display all 

compgen -b = to list all the built in command

type {file} = this will output the characteristics/properties of the file inputted

tr = translate, this command will replace the specified character with specified character
say, this is like excel's find and replace
example : cat file.txt | tr hello hi = this will replace hello with hi, if there is hello in file.txt

$PATH = this is a variable which will stores the path of external and commands we need 
$PWD = this output current working directory
$USER = this output username of the user
$SHELL = this output the path to the current shell system is using
$HOSTNAME = this outputs the hostname
$MACHTYPE = this output type of machine that we are using

we can use custom variables too, like
name=sharavana
echo $name = will output sharavana

foo='hello    world'
if we echo $foo = this will output hello world with single space, to get what we actually inputted use
echo "$foo" = this will output hello     world as we inputted

we can also unset the set variable using unset command
unset foo


