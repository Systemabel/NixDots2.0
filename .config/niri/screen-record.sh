#!/run/current-system/sw/bin/bash
pkill -f gpu-screen-recorder && notify-send 'Screen Recording Stopped' 'Saved to ~/Media/Screencapture/screen-record.mp4' || gpu-screen-recorder -w screen -f 60 -a default_output -o ~/Media/Screencapture/screen-record.mp4
