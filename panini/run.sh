docker build -t openmpi3.1-cudnn7.0-pytorch-1.1 .
nvidia-docker run -it --name panini --mount src=/home/xieche/panini,target=/workspace/panini,type=bind openmpi3.1-cudnn7.0-pytorch-1.1
