!# /bin/bash 


echo "Please write the URL"

#reading the url 
read url 

# using youtube-dl to download 
youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $url 


