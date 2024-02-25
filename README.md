# web-radio
Diagram for Web Radio Stream hosted by OBS broadcasters 

This is just a simple system using various open source software to allow for OBS users to stream to custom HTTPS livestream. It is a very simple set up, and I will detail the software used here. 


![Network Diagrams (1)](https://github.com/mothcrew/dreamlogic-web-radio/assets/137013984/36cfc500-b68a-4e65-8c99-2daa122f305e)

# Tech Used

## OBS 

Used for broadcasters, for streaming to custom RTMP server https://obsproject.com/

## RTMPie 

RTMP server (uses nginx-rtmp module) and management server https://github.com/ngrie/rtmpie?tab=readme-ov-file

## Icecast2 

https://icecast.org/ 

I used a simple script (under scripts dir) that executes ffmpeg and converts RTMP audio to Icecast HTTP stream

## NGINX

reverse proxying the Icecast streams using NGINX, used as front-end for user web access and SSL termination. 

https://www.nginx.com/



