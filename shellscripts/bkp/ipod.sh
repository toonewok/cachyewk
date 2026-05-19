musichost=~/ssd/music
ipod=/run/media/bailey/HEL/music


for d in "$musichost"/*; do
	
	
	[ -d "$d" ] || continue

	name=$(basename "$d")

	if [ ! -d "$ipod/$name" ]; then
		  
		echo "copying artist(new to ipod) $name"
		cp -Rv "$d" "$ipod/"

	else

		hostsubdir=$musichost/$name
		ipodsubdir=$ipod/$name

		for x in "$hostsubdir"/*; do

		[ -d "$x" ] || continue

		name=$(basename "$x")

		if [ ! -d "$ipodsubdir/$name" ]; then
		
			echo copy $x to $ipodsubdir
			cp -R "$x" "$ipodsubdir"

		else

			echo $x already exists...skipping

	
		fi 

		done 
	fi

done



