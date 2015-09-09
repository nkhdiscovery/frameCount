while read a 
do
#echo "img: $a"
    ffprobe -select_streams v -show_streams "$a" 2>/dev/null | grep nb_frames | sed -e 's/nb_frames=//'
done < <(ls $1/*.mp4) | tr '\n' '+'  | sed 's/+$/\n/g' | bc 
