From meadml/cuda10.0-cudnn7-devel-ubuntu16.04-python3.6
USER root

RUN apt update
RUN apt install software-properties-common && \
        add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get install wget 
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

RUN rm /usr/bin/python3 && ln -s python3.6 /usr/bin/python3 
RUN update-alternatives --remove python /usr/bin/python2 && update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN apt-get update && pip install --upgrade pip && apt-get install -y cmake
RUN pip3 install torch===1.6.0 torchvision===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html
RUN HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL pip3 install horovod
RUN apt-get update && apt-get install -y gcc
# RUN apt-get install -y vim wget apt-utils ssh 
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
RUN apt-get install -y git
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
RUN echo "set number" >> ~/.vimrc
RUN apt-get install less
CMD ["bash"]


#RUN git clone https://github.com/NVIDIA/apex  && \ 
#    cd apex && \
#    pip3 install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./ &&  \
#    cd .. && rm -rf apex
RUN pip3 install apex

# RUN pip3 install mpi4py

RUN pip install --upgrade pip

RUN rm /usr/bin/python && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    # rm /usr/bin/pip    && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    rm /usr/local/bin/pip && \
    ln -s /usr/bin/pip3 /usr/local/bin/pip
RUN apt-get update -y && \
    apt-get install -y libibverbs-dev

RUN pip3 install numba==0.48
RUN pip3 install pandas
RUN pip3 install tensorboard==1.15
RUN pip3 install onnxruntime
RUN pip3 install onnxruntime-gpu

CMD ["bash"]
