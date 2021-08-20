#! /bin/bash 

for ((;;))
do 

	printf "To exit press CTRL + C \n"

#Custome location answer 

cl=0
three=3

while (( cl ==  0 ))

do

printf  "Custom location ? \n 1)Yes \n 2)No \n Only Numbers! \n Write your input:  "

read cl #means custom location



if [ -z "${cl}" ];
then 
	printf "Please doni't leave it empty!\n"

elif [$cl -ge 3 ]
then 
	printf "Please stick to the options"
else 
	let $cl 
fi

done 

echo "Is it playlist \n 1)Yes -y \n 2)No - n ?"
read atp #means answer to playlist 

#to make sure the input is valid

if [ -z "$atp"]
then 
	echo "Please don't leave the input blank"
elif ["$atp" != "y" ] || ["$atp" != "n" ]
then 
	echo "Please enter valid option"
else 
	echo "\n YAY ! we are about to download " 

fi

echo "What do you want to download from youtube?\n 1)Video \n 2)Audio \n Please write your input: "
read input #the input is to know is it vidoe or audio 


case $input in 
	1)
			if [$atp == "y"] || [$atp == "yes"] 
				then 
					echo "write the url"
					read vup #means video url playlist
					#downloading youtube list 
					if (( $cl == "y" )) 
						then 
						youtube-dl -i -f mp4 --yes-playlist -o $cl "%(title)s.(%ext).s" $vup 
					fi
				else 
						youtube-dl -i -f mp4 --yes-playlist -o "%(title)s.(%ext).s" $vup 
			fi
					###	
					#downloading only video 
					if [ $atp == "n"] || [ $atp == "no"]
						then 
					echo "write the url"
					read vu #means video url 
					if (( $cl == "y" )) 
						then 
					youtube-dl -o -i -f mp4 -o $cl "%(title).s(%ext).s" $vu  
					fi 
					youtube-dl -o -i -f mp4 -o "%(title).s(%ext).s" $vu  
			fi
					###
					;;

	2) 

			if [$atp == "y"] || [$atp == "yes"] 

				then 
					echo "wrie the url "
					read aup #stands for audio url playlist 
					#downloading audio and it's playlist
					if (( "$cl" == "y" )) 
					then
					
					youtube-dl --extract-audio --audio-format mp3 -o $cl "%(title)s.%(ext)s" $url 
					fi

				else 

					youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $url 
				fi
				;;

	*)
		echo "Please enter valid option" 
		;;

		
	
		esac

	echo "to stop it PRESS CTRL + C"
done 

