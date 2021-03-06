# Setup Pytorch with CUDA and Apex support in Azure VM

In this readme file, we are trying to use Azure VM to maintain and
update the frequently used Docker image, and then push to Docker Hub, so as to use anywhere.

## Create Azure VM

In Azure Portal, create VM machine with NVidia supported image,
such as NVIDIA Image for AI using GPUs, with latest Nvidia driver.
By default, the docker, and a relatively new CUDA driver is
installed, e.g. cuda11.0.

## Install NVidia-docker [reference link](https://github.com/chenxie95/dockerfiles.git)

```bash
  distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
               && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
               && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
               sudo tee /etc/apt/sources.list.d/nvidia-docker.list

  sudo apt-get update

  sudo apt-get install -y nvidia-docker2

  sudo systemctl restart docker

```

Now we should be able to use nvidia-docker

## Install miniconda [reference link](https://docs.conda.io/en/latest/miniconda.html)

```
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  bash Miniconda3-latest-Linux-x86_64.sh
```

after installation, you need to re-open the shell to use it with command conda

## Manully Install Pytorch [reference link](https://github.com/pytorch/pytorch)

```
  conda install numpy ninja pyyaml mkl mkl-include setuptools cmake cffi typing_extensions future six requests dataclasses
  conda install -c pytorch magma-cuda110
  git clone --recursive https://github.com/pytorch/pytorch
  cd pytorch
  git checkout release/1.8
  git submodule sync
  git submodule update --init --recursive
  export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
  python setup.py install
  python setup.py develop && python -c "import torch"
```

## Install Apex

```
  git clone https://github.com/NVIDIA/apex
  cd apex
  pip3 install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext"
  cd .. && rm -rf apex
```

The main reason I would like to install Pytorch manually is that probably in Pytorch's website, for the latest pytorch version, it only support some specific CUDA version. It is fine to install Pytorch with lower version, but will trigger error when install Apex
