# dreamlogic-web-radio
Web Radio Stream hosted by OBS broadcasters in Southeast US (Birmingham, AL)

This is just a simple system using various open source software to allow for OBS users to stream to custom HTTPS livestream. It is a very simple set up, and I will detail the software used here. 


![Network Diagrams (1)](https://github.com/mothcrew/dreamlogic-web-radio/assets/137013984/36cfc500-b68a-4e65-8c99-2daa122f305e)

# Tech Used

## OBS 

Used for broadcasters, for streaming to custom RTMP server https://obsproject.com/

## RTMPie 

RTMP server (uses nginx-rtmp module) and management server https://github.com/ngrie/rtmpie?tab=readme-ov-file

## Icecast2 

https://icecast.org/ - sample bash script (under scripts dir) that uses ffmpeg to convert RTMP audio to Icecast HTTP stream

## NGINX

Last but not least, proxying the Icecast streams using NGINX reverse proxy, used as front-end for user web access and SSL termination. 

https://www.nginx.com/

# Web Radio Server

https://radio.dreamlogic.dev/

The streams are not always live. This is a community web radio project, ran by people in their spare time. If you have any questions or issues, please reach out to support@dreamlogic.dev


