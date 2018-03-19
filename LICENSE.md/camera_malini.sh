HOST=192.168.8.162

raspivid -n -w 1280 -h 720 -b 4500000 -fps 30 -vf -hf -t 0 -o - | \
gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=10 pt=96 ! \
udpsink host=$HOST port=9000

