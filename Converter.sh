#This is third prgram
#this program can using for converting Video file from one format to another format
#!/bin/bash
sudo apt-get install ffmpeg -y
sudo apt-get install zenity -y
exit_function() {
if [ "$?" == 1 ]; then
 exit
fi
}
###########################################################################################################################################
choose_file() {
file=$(zenity --file-selection --title="Select a file to convert" --width=600 --height=580) #select a input file
exit_function;
}

###########################################################################################################################################

dest_folder(){
dest_location=$(zenity --file-selection --title="Select a folder for output images" --directory --width=600 --height=580) 
#select a destination folder 
exit_function;
}
###########################################################################################################################################

video_converter() {
 select_file_extension=$(zenity --list --text="Choose Your's Option" --title="Your's Option" --radiolist --column "Select" --column "Option No." --column "Description" TRUE "AVI" "Audio Video Interleave" FALSE "FLV " "Flash Video Format" FALSE "WMV" "Windows Media Video" FALSE "MOV" "Apple Quick Time Video" FALSE "MP4" "Moving Pictures Expert Group 4" "H.264" "Video Encoding Format" "3GP" " 3rd Generation Partnership Project (3GPP)" "GIF" "Graphics Interchange Format" --width=600 --height=580);
exit_function;
}
###########################################################################################################################################

#audio_converter(){

#}
###########################################################################################################################################
#video_to_image_converter(){

#}
###########################################################################################################################################
welcome_message() {
zenity --info --text="Welcome to My Converter!" --title="Video Converter!" --width=600 --height=580 --ok-label="Continue";
#just displaying Welcome message.
}
###########################################################################################################################################
end_message() {
zenity --info --text="Thank You For Using My Converter!" --title="My Converter!" --width=600 --height=580 --ok-label="Bye!";
}
###########################################################################################################################################
output_file_name(){
output_name=$(zenity --entry  --text="Type output file name" --title="Give name of output files" --width="600" --height=580 )
exit_function;
}
###########################################################################################################################################
option_chooser() {
 option=$(zenity --list --text="Choose Your's Option" --title="Your's Option" --radiolist --column "Select" --column "Option No." --column "Description" TRUE "10" "Video to mp3" FALSE "20" "Video to Imageframes" FALSE "30" "Video bitrate change" FALSE "40" "Change of frame rate" FALSE "50" "Audio to audio converter" FALSE "60" "VIDEO TO ANOTHER VIDEO FORMAT"  --width=600 --height=580);
exit_function;

}
############################################################################################################################################
############################################################################################################################################
############################################################################################################################################
#main program Starting From Here.........

welcome_message;
option_chooser;
if [ "$option" == 10 ]; then #video into soundfile
 exit_function;
 choose_file;
 dest_folder;
 output_file_name;
select_file_extension=$(zenity --list --title="Select a output file extension" --text="Select a file format" --column="     select"  "mp3" "3gp" "aiff" "aac" "m4p" "ogg" "opus" "wav" "webm"  --width=600 --height=600 )
 ffmpeg -i "$file" "$dest_location"/"$output_name"."$select_file_extension"

elif [ "$option" == 20 ]; then #Video to imageframes
 exit_function;
 choose_file;
 dest_folder;
 output_file_name;
 select_file_extension=$(zenity --list --title="Select a output file extension" --text="Select a file format" --column="     select"  "jpg" "png" "jpeg" "gif" "bmp" "tiff" "exif" "jpeg2000"  --width=600 --height=600 )
 ffmpeg -i "$file" "$dest_location"/"$output_name"%d."$select_file_extension"

elif [ "$option" == 30 ]; then  #Video Bitrate Change######### need special look
 exit_function;
 choose_file;
 dest_folder;
 output_file_name;
 select_bitrate=$(zenity --list --title="Select a output Video Bitrate" --text="Select Output Bitrate" --column="     select"  "32K" "64k" "128k" "256k" "512k" "1024K" --width=600 --height=600)
 ffmpeg -i "$file" -b:v "$select_bitrate" -bufsize "$select_bitrate" "$output_name".avi

elif [ "$option" == 40 ]; then #Changing Frame Rate
 exit_function;
 choose_file;
 dest_folder;
 output_file_name;
 select_file_extension=$(zenity --list --text="Choose Your's Option" --title="Your's Option" --radiolist --column "Select" --column "Option No." --column "Description" TRUE "AVI" "Audio Video Interleave" FALSE "FLV " "Flash Video Format" FALSE "WMV" "Windows Media Video" FALSE "MOV" "Apple Quick Time Video" FALSE "MP4" "Moving Pictures Expert Group 4" "H.264" "Video Encoding Format" "3GP" " 3rd Generation Partnership Project (3GPP)" "GIF" "Graphics Interchange Format" --width=600 --height=580);
 out_frame_rate=$(zenity --entry --text="enter output frame rate" title="Frame rate selector")

 ffmpeg -y -i "$file" -vf "setpts=1.25*PTS" -r "$out_frame_rate" "$dest_location"/"$output_name"."$select_file_extension" 

elif [ "$option" == 50 ]; then #Audio to Audio converter
 exit_function;
 choose_file;
 dest_folder;
 output_file_name;

elif [ "$option" == 60 ]; then
 exit_function;
 choose_file;
 dest_folder;
 output_file_name;
 video_converter;

end_message;
fi




