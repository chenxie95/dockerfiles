docker build -t rnnt-cuda10.2-torch1.8 .
docker tag rnnt-cuda10.2-torch1.8:latest chenxie95/rnnt-cuda10.2:torch1.8
docker push chenxie95/rnnt-cuda10.2:torch1.8
nvidia-docker run -it --name rnnt-cuda11.0 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda11.0:torch1.8
