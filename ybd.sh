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


			printf "${red} Please enter the url to download it as mp3 \n Write it here : ${grn}" 

			read url 

youtube-dl --extract-audio --audio-format mp3 $url

		done 
