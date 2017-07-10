#!/bin/bash

#cvlc v4l2:///dev/video0:input=1 --sout '#std{access=http,mux=mpjpeg,dst=192.4.100.100:8888}'
#cvlc v4l2:///dev/video0:input=1 --sout '#transcode{vcodec=mjpg}:std{access=http,mux=mpjpeg,dst=192.4.100.100:8081}'
#cvlc v4l2:///dev/video0:input=1 --sout '#transcode{vcodec=mjpg}:std{access=http{mime=multipart/x-mixed-replace;boundary=7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=192.4.100.100:8081}'

#/usr/bin/cvlc --daemon -I dummy v4l2:///dev/video0:input=1 --sout '#transcode{vcodec=mjpg}:std{access=http{mime=multipart/x-mixed-replace;boundary=7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=192.4.100.100:8081}'
/usr/bin/cvlc --daemon -I dummy v4l2:///dev/video0:input=1 :v4l2-standard=PAL_BG :v4l2-width=640 :v4l2-height=480 :v4l2-aspect-ratio=4\:3 :v4l2-fps=60 --sout '#transcode{vcodec=mjpg}:std{access=http{mime=multipart/x-mixed-replace;boundary=7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=192.4.100.100:8081}' 


#cvlc v4l2:///dev/video0:input=1 --sout '#transcode{vcodec=mp2v,vb=800,acodec=none}:rtp{sdp=rtsp://192.4.100.100:8888/}'
#cvlc v4l2:///dev/video0:input=1 --sout '#transcode{vcodec=mp2v,vb=800,acodec=none}:rtp{dst=192.4.100.100,port=8888,mux=ts}'
