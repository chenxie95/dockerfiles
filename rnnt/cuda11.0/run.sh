docker build -t rnnt-cuda11.0 .
docker tag rnnt-cuda11.0:latest chenxie95/rnnt-cuda11.0:latest
docker push chenxie95/rnnt-cuda11.0:latest
nvidia-docker run -it --name rnnt-cuda11.0 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda11.0:latest
