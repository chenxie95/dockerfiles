docker build -t ubuntu18.04-openmpi .
docker tag ubuntu18.04-openmpi:latest chenxie95/ubuntu18.04-openmpi:latest
docker push chenxie95/ubuntu18.04-openmpi:latest
docker run -it --name cpucluster chenxie95/ubuntu18.04-openmpi:latest

