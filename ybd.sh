#! /bin/bash 

#colors 

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'


##vars 

http=0 

for ((;;))
do 
	printf "${cyn} 
        ___.        .___
 ___.__.\_ |__    __| _/
<   |  | | __ \  / __ | 
 \___  | | \_\ \/ /_/ | 
 / ____| |___  /\____ | 
 \/          \/      \/ 

			${end} \n"



		printf "${cyn} WELCOME ${USER} , Youtube downloader will help you to download anything from youtube and to avoid ads \n ${end}"
		
		
		
		
			printf '\e[1;34m%-6s\e[m' " To exit press CTRL + C "

#Custom location answer validating loop if the answer is wrong will start again and not going to the next   

cl=0


while (( cl ==  0 ))

do

printf  "\n ${red}Custom location ? \n 1)Yes \n 2)No \n Only Numbers! \n Write your input: ${end} "

read cl #means custom location

#if condition to make sure the input is right 

if [ -z "${cl}" ];

then 
	printf "\n ${yel} Please doni't leave it empty! ${end}\n"

elif [ $cl -ge 3 ];
then 
	printf "\n ${yel} Please stick to the options ${end}\n"
	 
	cl=0
elif [ $cl -eq 2 ];
then  
	printf "\n NOTE IT WILL DOWNLOAD THIS CURRENT \n ${blu} ${PWD} ${end} \n" 	
	
	let $cl 

elif [ $cl -eq 1 ]; 
then 

	pathlength=0 
	
	while (( pathlength == 0 )) 
	
	do 

	printf "\n ${grn} Write the path please: ${end}\n"
	
	read dpath #stands for dirctory path

	let pathlength=`expr "$dpath" : '.*'` 

	if [ $pathlength -eq 0 ];
	then 
		printf "\n ${yel} Please write  a path ${end}\n"
		
		dpath=0 
	else 
		let $dpath 

	fi 


		done 
	let $cl
else 

	printf "\n ${yel} Please stick to the options ${end}\n"

fi

done 

### END FOR VALDATING CUSTOM LOCATION ###



### Loop for the answer if input not vaild it will start again

atp=0 

while (( atp == 0 )) 

do 

printf  "\n ${red}Is it playlist \n 1)Yes \n 2)No  \n Only Numbers \n Write your input:  ${end}"

read atp #means answer to playlist 

#to make sure the input is valid

if [ -z "${atp}" ];

then 
	printf "\n ${yel}Please don't leave the input blank ${end} \n"

elif [ $atp -ge 3 ] ;

then 
	printf "\n ${red}  Please enter valid option ${end} \n"
	atp=0
else 
	
	printf  "\n ${red}YAY ! we are about to download ${end} \n" 
	
	let $atp

fi

done 

### ENDING FOR VALDATING ANSWER TO PLAYLIST ###

printf  "\n ${red} What do you want to download from youtube?\n 1)Video \n 2)Audio \n Please write your input: ${end}"

read input #the input is to know is it vidoe or audio 


case $input in 
	1)
		for ((;;))	
		do 		
			printf "\n ${grn} write the url: ${end}"
					read vup #means video url playlist

			if [$atp -eq 1 ] && [$cl -eq 1] ;
				then 
	
					#downloading youtube list 
					
						youtube-dl -i -f mp4 --yes-playlist -o $dpath "%(title)s.(%ext).s" $vup 
					
			else 
						youtube-dl -i -f mp4 --yes-playlist -o "%(title)s.(%ext).s" $vup 
					
			fi 

		done 
					###	
					#downloading only video 
			if [$atp -eq 2] && [$cl -eq 1];		
					 
					printf  "write the url"
					
					read vu #means video url 
					
						then 
					youtube-dl -o -i -f mp4 -o $dpath "%(title).s(%ext).s" $vu  

					
				else 
					
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

