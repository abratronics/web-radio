#!/bin/bash

# RTMP stream URLs
stream1="rtmp://example.com/live/misc"
stream2="rtmp://example.com/live/noise"
stream3="rtmp://example.com/live/talk"

# Icecast output URLs
output1="icecast://source:***@example.com:8000/misc.mp3"
output2="icecast://source:***@example.com:8000/noise.mp3"
output3="icecast://source:***@example.com:8000/talk.mp3"

# check if RTMP Stream is alive
check_stream() {
    stream_url=$1
    timeout_duration=5 

    if timeout $timeout_duration ffprobe -loglevel error -i $stream_url -show_entries stream=width -of csv=p=0; then
        return 0  # Stream is alive
    else
        return 1  # Stream is not alive
    fi
}

# use ffmpeg to convert RTMP input URL to Icecast HTTP Audio stream
execute_ffmpeg() {
    input_url=$1
    output_url=$2

    ffmpeg -re -i $input_url -vn \
           -codec:a libmp3lame -b:a 64k -f mp3 \
           -content_type audio/mpeg \
           $output_url
}

# Check and execute in parallel
if check_stream $stream1; then
    execute_ffmpeg $stream1 $output1 &
else
    echo "Stream 1 is not alive"
fi

if check_stream $stream2; then
    execute_ffmpeg $stream2 $output2 &
else
    echo "Stream 2 is not alive"
fi

if check_stream $stream3; then
    execute_ffmpeg $stream3 $output3 &
else
    echo "Stream 3 is not alive"
fi

# Wait for all background processes to finish
wait

