FROM horovod/horovod:0.19.1-tf2.1.0-torch1.4.0-mxnet1.6.0-py3.6-gpu 
USER root

RUN apt update
RUN apt-get -y install wget

RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh && \
    bash Anaconda3-2019.03-Linux-x86_64.sh -b
ENV PATH /root/anaconda3/bin/:$PATH

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

# RUN pip install torch==1.4.0+cu92 torchvision==0.5.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html
# RUN apt autoremove -y python && apt autoremove -y python3
# RUN apt update
# RUN apt install -y software-properties-common
# RUN add-apt-repository ppa:deadsnakes/ppa
# RUN apt-get update
# RUN apt-get install -y python3.8
#RUN alias python3='python3.8' && \
#     alias python='python3.8'
# RUN ln -s /usr/bin/python3.8 /usr/bin/python && \
#    ln -s /usr/bin/python3.8 /usr/bin/python3 
RUN apt-get -y install python3-pip

RUN pip3 uninstall torch
# RUN pip3 install torch torchvision
RUN pip3 install torch==1.5.1+cpu torchvision==0.6.1+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL pip3 install horovod
RUN apt-get update && apt-get install -y gcc
RUN apt-get install -y vim wget apt-utils ssh 
RUN pip3 install soundfile && \
        pip3 install unidecode && \
        pip3 install sentencepiece && \
        pip3 install editdistance && \
        pip3 install tensorboard_logger && \
        pip3 install py3nvml && \
        pip3 install librosa && \
        pip3 install kenlm 
RUN apt-get -y install libsndfile1-dev
RUN apt-get -y install unzip
RUN wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip && \
        unzip ninja-linux.zip -d /usr/local/bin/ && \
        update-alternatives --install /usr/bin/ninja ninja /usr/local/bin/ninja 1 --force

RUN pip3 install gpustat
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
RUN echo "set number" >> ~/.vimrc
RUN apt-get install less

RUN git clone https://github.com/NVIDIA/apex  && \ 
    cd apex && \
    pip3 install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./ &&  \
    cd .. && rm -rf apex

RUN pip3 install mpi4py

RUN pip install --upgrade pip
RUN pip install onnx && \
    pip install sympy && \
    pip install packaging && \
    pip install pandas

CMD ["bash"]
