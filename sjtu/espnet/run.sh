docker build -t espnet .
docker tag espnet:latest chenxie95/espnet:latest
docker push chenxie95/espnet:latest
nvidia-docker run -it --name rnnt-cuda10.2 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda10.2:latest
