FROM lbjcom/cuda9.2_pytorch1.3_warp_ctc:latest
USER root

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

RUN pip install torch==1.4.0+cu92 torchvision==0.5.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html
RUN HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL pip install horovod
RUN apt-get update && apt-get install -y gcc
RUN apt-get install -y vim wget apt-utils ssh 
RUN pip install soundfile && \
        pip install unidecode && \
        pip install sentencepiece && \
        pip install editdistance && \
        pip install tensorboard_logger && \
        pip install py3nvml && \
        pip install librosa && \
        pip install kenlm 
RUN apt-get -y install libsndfile1-dev
RUN apt-get -y install unzip
RUN wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip && \
        unzip ninja-linux.zip -d /usr/local/bin/ && \
        update-alternatives --install /usr/bin/ninja ninja /usr/local/bin/ninja 1 --force

RUN pip install gpustat
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
RUN echo "set number" >> ~/.vimrc
RUN apt-get install less

RUN git clone https://github.com/NVIDIA/apex  && \ 
    cd apex && \
    pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./ &&  \
    cd .. && rm -rf apex

RUN pip install mpi4py

RUN pip install --upgrade pip

CMD ["bash"]

