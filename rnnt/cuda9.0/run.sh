docker build -t rnnt-cuda9.0 .
docker tag rnnt-cuda9.0:latest chenxie95/rnnt-cuda9.0:latest
docker push chenxie95/rnnt-cuda9.0:latest
nvidia-docker run -it --name rnnt-cuda9.0 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind rnnt-cuda9.0
