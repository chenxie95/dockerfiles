install nvidia-docker. c.f. https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
assuming docker is installed in the image provided by NVidia
step 1: add nvidia-docker install package to the source list
  distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

step 2: sudo apt-get update

step 3: sudo apt-get install -y nvidia-docker2

step 4: sudo systemctl restart docker

Now we should be able to use nvidia-docker


install miniconda

Step 1: wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
Step 2: bash Miniconda3-latest-Linux-x86_64.sh 
Step 3: after installation, you need to re-open the shell to use it with command conda
