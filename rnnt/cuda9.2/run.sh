docker build -t rnnt-cuda9.2 .
docker tag rnnt-cuda9.2:latest chenxie95/rnnt-cuda9.2:latest
docker push chenxie95/rnnt-cuda9.2:latest
nvidia-docker run -it --name rnnt-cuda9.2 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind rnnt-cuda9.2
nvidia-docker run -it --name rnnt-cuda9.2 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind rnnt-cuda9.2
