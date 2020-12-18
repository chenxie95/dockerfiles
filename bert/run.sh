docker build -t bert .
nvidia-docker run -it --name bert --mount src=/home/xieche/pytorch-pretrained-BERT,target=/workspace/bert,type=bind bert

docker tag bert chenxie95/bert
docker push chenxie95/bert
