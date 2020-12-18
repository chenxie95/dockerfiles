docker build -t rnnt-cpu .
docker tag rnnt-cpu:latest chenxie95/rnnt-cpu:latest
docker push chenxie95/rnnt-cpu:latest
nvidia-docker run -it --name rnnt-cpu --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind rnnt-cpu
