#!/usr/bin/env bash
echo "If statements are very useful in bash scripts"
echo "Here are two ways to find a string inside another string."
echo

echo "First, using the wildcard operator *"
STR='GNU/Linux is an operating system'
SUB='Linux'
if [[ "$STR" == *"$SUB"* ]]; then
  echo "It's there."
fi

echo "Second, using a regular expression (REGEX) and testing a match with =~"
if [[ "$STR" =~ .*"$SUB".* ]]; then
  echo "It's there."
fi

echo
echo "And here is an IF...THEN...ELSE...FI loop"
echo -n "Enter a number: "
read VAR

if [[ $VAR -gt 10 ]]
then
  echo "The variable is greater than 10."
else
  echo "The variable is equal or less than 10."
fi

