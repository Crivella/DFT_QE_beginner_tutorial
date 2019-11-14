#!/usr/bin/env bash
echo "Echo prints what appears within the quotes." 
echo
echo -e "Some shells accept -e as an argument to echo.\nThis allows backslashes to be interpreted, e.g. as a new line\nor a \ttab." 
echo

STR="This is how to print a string."                                               #!!!!!! There must be no spaces when assigning variable
echo "This is NOT how to print a string:"
echo STR
echo $STR
echo						# Prints a blank line

i=2
suffix=".txt"
FILE=pippo                              #NAME=something assign a variable of name NAME and value something (can be a string ora  number)
                                           #Use "... ..." for a string with spaces
echo 'Variables are defined using <var>=<value> or <var>="<value>"'

echo "Short name: " $FILE
echo "Full name : " $FILE$suffix
echo "Use filename $FILE inside quotes" 
echo "Use filename $FILE$suffix inside quotes" 
echo "Make sure variable name is not modified by other letters: $FILE_2$suffix" 
echo "Safest way: ${FILE}_2$suffix" 
echo

NEWSTRING="${FILE}_2$suffix" 
echo "Or use a new string: " $NEWSTRING

echo
echo 'Use single quotes to print backslashes: \n'
echo 'Use single quotes to suppress variable expansion: $NEWSTRING \n'

echo
VAR1="topolino"
VAR1+=" is dead"
echo 'Use += to append to a variable: ' $VAR1

echo
echo 'Take care not to put spaces when defining a variable. Use " ... " if you need spaces.'
WRONG= pipi
echo "Empty string: " $WRONG
