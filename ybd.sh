!# /bin/bash 


echo "Custom location ? \n 1)Yes - y \n 2)No - n"
read cl #means custom location

#to make sure the input is valid

if [-z "$cl" ] 
then 
	echo "Please don't leave the input blank"
elif ["$cl" != "y" ] || ["$cl" != "n"]
then 
	echo "Please enter vaild option"
else 
	echo "\n Ok let's go"

fi 

echo "Is it playlist \n 1)Yes -y \n 2)No - n ?"
read atp #means answer to playlist 

#to make sure the input is valid

if [-z "$atp"]
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
					elif [$atp == "n"] || [$atp == "no"]
						then 
					echo "write the url"
					read vu #means video url 
					if (( $cl == "y" )) 
						then 
					youtube-dl -o -i -f mp4 -o $cl "%(title).s(%ext).s" $vu  
					fi 
					youtube-dl -o -i -f mp4 -o "%(title).s(%ext).s" $vu  
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



