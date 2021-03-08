docker build -t rnnt-cuda11.0-torch1.7 .
docker tag rnnt-cuda11.0-torch1.7:latest chenxie95/rnnt-cuda11.0:torch1.7
docker push chenxie95/rnnt-cuda11.0:torch1.7
nvidia-docker run -it --name rnnt-cuda11.0 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda11.0:torch1.7
