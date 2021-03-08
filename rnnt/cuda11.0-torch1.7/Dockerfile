From aegis1/cuda11.0-cudnn8-devel-ubuntu18.04
USER root

RUN apt-get update -y
RUN apt-get -y install wget

ENV OPENMPI_VERSION=4.0
ENV OPENMPI_STRING=openmpi-${OPENMPI_VERSION}.0
RUN mkdir /tmp/openmpi && \
        cd /tmp/openmpi && \
        wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.0.tar.gz && \
        tar zxf ${OPENMPI_STRING}.tar.gz && \
        cd ${OPENMPI_STRING} && \
        ./configure --enable-orterun-prefix-by-default --with-openib --prefix /usr/local/mpi && \
        make -j 4 all && \
        make install && \
        ldconfig && \
        rm -rf /tmp/openmpi && \
        test -f /usr/local/mpi/bin/mpic++  # Sanity check
ENV PATH /usr/local/mpi/bin:$PATH

RUN apt-get -y install python3-pip

# manually install pytorch
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
      	bash Miniconda3-latest-Linux-x86_64.sh -b

# install dependencies
RUN apt-get install -y git
RUN conda install -y numpy ninja pyyaml mkl mkl-include setuptools cmake cffi typing_extensions future six requests dataclasses && \
    	conda install -y -c pytorch magma-cuda110 && \
	git clone --recursive https://github.com/pytorch/pytorch && \
	cd pytorch && \
	git checkout release/1.7 && \
	git submodule sync && \
	git submodule update --init --recursive
ENV CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"} 
RUN cd pytorch && python3 setup.py install && \
	python3 setup.py develop
RUN python3 -c "import torch"

RUN apt-get -y install cmake
RUN HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL pip3 install horovod
RUN apt-get update && apt-get install -y gcc
RUN apt-get install -y vim wget apt-utils ssh 
RUN pip3 install soundfile && \
        pip3 install unidecode && \
        pip3 install sentencepiece && \
        pip3 install editdistance && \
        pip3 install tensorboard_logger && \
        pip3 install py3nvml && \
        pip3 install librosa 
RUN apt-get -y install libsndfile1-dev
RUN apt-get -y install unzip && \
    apt-get -y install git
RUN wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip && \
        unzip ninja-linux.zip -d /usr/local/bin/ && \
        update-alternatives --install /usr/bin/ninja ninja /usr/local/bin/ninja 1 --force

RUN pip3 install gpustat
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
RUN echo "set number" >> ~/.vimrc
RUN apt-get install less

RUN git clone https://github.com/NVIDIA/apex  && \ 
    cd apex && TORCH_CUDA_ARCH_LIST="3.7;6.0;7.0" \
    pip3 install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./ &&  \
    cd .. && rm -rf apex

RUN pip3 install mpi4py

RUN pip install --upgrade pip

#RUN rm /usr/bin/python && \
#    ln -s /usr/bin/python3 /usr/bin/python && \
#    rm /usr/bin/pip    && \
#    ln -s /usr/bin/pip3 /usr/bin/pip && \
#    rm /usr/local/bin/pip && \
#    ln -s /usr/bin/pip3 /usr/local/bin/pip

# install the IB driver
RUN apt-get install -y libibverbs-dev

RUN pip install numba==0.48
RUN pip install pandas
RUN pip install tensorboard==1.15
RUN pip install onnx
RUN pip install onnxruntime
RUN pip install onnxruntime-gpu

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10 

CMD ["bash"]
