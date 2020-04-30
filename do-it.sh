tagesschau_playlist="https://www.youtube.com/watch?v=hj8dRSOVhis&list=PL4A2F331EE86DCC22"
videos=$(youtube-dl -j --flat-playlist "$tagesschau_playlist" | jq -r '.id')

for video in $videos
do
  echo Processing $video
  youtube_url="https://youtu.be/$video"
  input_file=$(youtube-dl -f 22 --get-url "$youtube_url")

  screenshot_time="17"
  output_file="17s/$video-${screenshot_time}s.jpg"
  ffmpeg -ss "$screenshot_time" -i $input_file -vframes 1 -q:v 2 "$output_file"

  #screenshot_time="0"
  #output_file="0s/$video-${screenshot_time}s.jpg"
  #ffmpeg -ss "$screenshot_time" -i $input_file -vframes 1 -q:v 2 "$output_file"
done
