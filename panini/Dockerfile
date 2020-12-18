FROM nvidia/cuda:9.1-cudnn7-devel
USER root
RUN apt-get update && apt-get install -y gcc
RUN apt-get install -y vim wget apt-utils ssh 
#### INSTALL OPENMPI ####
RUN apt-get update && \
    apt-get install \
        libc6-dev \
        libc6 \
        g++-5 \
        libexpat1-dev \
        libjpeg-dev \
        libpng-dev \
        libjpeg-turbo8-dev \
        libjpeg8-dev \
        libpng12-0 \
        libpython-dev \
        libstdc++-5-dev \
        zlib1g-dev -y && \
    ln -s /usr/include/asm-generic/ /usr/include/asm

ENV OPENMPI_VERSION=3.1
ENV OPENMPI_STRING=openmpi-${OPENMPI_VERSION}.1
RUN mkdir /tmp/openmpi && \
		cd /tmp/openmpi && \
		wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.1.tar.gz && \
		tar zxf ${OPENMPI_STRING}.tar.gz && \
		cd ${OPENMPI_STRING} && \
		./configure --enable-orterun-prefix-by-default --with-openib --prefix /usr/local/mpi && \
		make -j 4 all && \
		make install && \
		ldconfig && \
		rm -rf /tmp/openmpi && \
	   	test -f /usr/local/mpi/bin/mpic++  # Sanity check
ENV PATH /usr/local/mpi/bin:$PATH


### INSTALL curl, python3, pip
RUN apt-get install curl
RUN apt-get install python3 libpython3-dev && \
		ln -s /usr/bin/python3 /usr/bin/python
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
		python get-pip.py && \
		rm get-pip.py

RUN pip install --upgrade pip && \
		pip install -U spacy

### INSTALL CONDA ####
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
		wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh -O ~/anaconda.sh && \
		/bin/bash ~/anaconda.sh -b -p /opt/conda && \
		rm ~/anaconda.sh
ENV PATH /opt/conda/bin:$PATH

RUN pip install --upgrade pip && \
		pip install msgpack argparse
RUN apt-get install -y git
RUN conda install mpi4py matplotlib && \
	 	conda install pytables graphviz psutil && \
		pip install ipdb py3nvml git+https://github.com/szagoruyko/pytorchviz  && \
		pip install cffi tqdm pandas py3nvml tensorboard_logger tables gpustat

RUN conda install pytorch torchvision cudatoolkit=9.0 -c pytorch
RUN curl http://j.mp/spf13-vim3 -L -o - | sh

RUN apt-get update && apt-get install -y cifs-utils

CMD ["bash"]

