docker build -t rnnt-cuda11.1 .
docker tag rnnt-cuda11.1:latest chenxie95/rnnt-cuda11.1:latest
docker push chenxie95/rnnt-cuda11.1:latest
nvidia-docker run -it --name rnnt-cuda11.1 --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda11.1:latest
