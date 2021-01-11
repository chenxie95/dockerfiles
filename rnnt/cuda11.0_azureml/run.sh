docker build -t rnnt-cuda11.0-azureml .
docker tag rnnt-cuda11.0-azureml:latest chenxie95/rnnt-cuda11.0-azureml:latest
docker push chenxie95/rnnt-cuda11.0-azureml:latest
nvidia-docker run -it --name rnnt-cuda11.0-azureml --mount src=/home/xieche/RNNTTrain.pytorch/speech_transducers/,target=/workspace/rnnt,type=bind --mount src=/raid/xieche/3khTrainData/,target=/data/3khTrainData,type=bind chenxie95/rnnt-cuda11.0-azureml:latest
