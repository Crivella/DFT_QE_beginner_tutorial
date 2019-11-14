#!/usr/bin/env bash

echo "Write a string to a file, creating it."
SAVE=E_vs_ecut.dat			
echo -e "# ecut(Ry)\tEnergy(Ry)" > $SAVE	# COMMAND > NAME  write the stdout of the command COMMAND into the file NAME
						#Create the file if it does not exist
						#Overwrite the file it exist
						#Use >> to append at the end of the file

my_energy="pippo"
echo "Write a block of text to a file"
cat >> $SAVE << EOF
1 10
2 20
3 $my_energy
4 45
EOF

echo "Contents of new file:"
cat $SAVE
echo
echo 'Run commands in the shell '
COMMAND="grep pippo $SAVE"
$COMMAND

echo
echo 'Run a command on the shell using backticks `` '
match=`grep pippo $SAVE | awk '{print $2}' `
echo "Found a match: " $match
echo

echo 'Replace a string in a file with sed'
sed -e "s/$my_energy/30/g" $SAVE > E_vs_ecut.dat_corrected
echo "Corrected file"
cat E_vs_ecut.dat_corrected
