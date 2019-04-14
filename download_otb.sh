#!/bin/bash

echo "****************** Install aria2 ******************"
sudo apt-get install aria2

echo "****************** Downloading Dataset ******************"
baseurl="http://cvlab.hanyang.ac.kr/tracker_benchmark"
wget "$baseurl/datasets.html"
cat datasets.html | grep '\.zip' | sed -e 's/\.zip".*/.zip/' | sed -e s'/.*"//' >files.txt
cat files.txt | xargs -n 1 -P 8 -I {} aria2c -x 16 "$baseurl/{}"