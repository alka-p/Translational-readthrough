
#!/bin/bash
#purpose: process a file line by line with redirected while-read loop
#Author: Alka Potdar

filename=$1
count=0

while read line
do 
	let count++
	genesym="$(echo $line | cut -d " " -f1)"
#	humanid="$(echo $line | cut -d " " -f2)"
#	mouseid="$(echo $line | cut -d " " -f3)"
#	echo "$count $line"
#	echo "$genesym" >> $genesym.fa
#	pattern1=$humanid
	pattern=$genesym
	
	grep -i -A 1 "|$pattern\>" macaca_dclean_trans.txt >> macaca_list.fa
#	grep -i -A 1 "|$pattern\>" mouse_dclean_trans60.fa >> $genesym.fa
#	grep -i -A 1 "|$pattern\>" rat_dclean_trans60.fa >> $genesym.fa
#	grep -i -A 1 "|$pattern\>" bos_dclean_trans60.fa >> $genesym.fa
#	grep -i -A 1 "|$pattern\>" macaca_dclean_trans60.fa >> $genesym.fa
        
#	echo "$genesym" >> out
#        clustalw2 $genesym.fa >> out 
	
done < $filename
echo "\nTotal $count Lines read"
