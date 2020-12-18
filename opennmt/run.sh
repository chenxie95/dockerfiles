docker build -t opennmt .
nvidia-docker run -it --name opennmt --mount src=/home/xieche/OpenNMT/OpenNMT-py,target=/workspace/opennmt,type=bind opennmt
