numLines=$(wc -l < ~/.tmp/rangerpick)
for i in $(seq 1 $numLines);
do
	nthLine=$(sed "${i}q;d" ~/.tmp/rangerpick)
	xdotool type "$nthLine"
	xdotool key Return
done

