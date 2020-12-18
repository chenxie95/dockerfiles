docker build -t rnnt-cuda10.2_torch1.7 .
docker tag rnnt-cuda10.2_torch1.7:latest chenxie95/rnnt-cuda10.2_torch1.7:latest
docker push chenxie95/rnnt-cuda10.2_torch1.7:latest
nvidia-docker run -it --name rnnt-cuda10.2_torch1.7 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda10.2_torch1.7:latest
