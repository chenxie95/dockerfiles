docker build -t rnnt-cuda11.1 .
# manually install apex
sudo nvidia-docker run -it rnnt-cuda11.1:latest
sudo docker commit <container-id>  rnnt-cuda11.1:torch1.8

sudo docker tag rnnt-cuda11.1:torch1.8 chenxie95/rnnt-cuda11.1:latest
sudo docker push chenxie95/rnnt-cuda11.1:latest
sudo nvidia-docker run -it --name rnnt-cuda11.1 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda11.1:latest
