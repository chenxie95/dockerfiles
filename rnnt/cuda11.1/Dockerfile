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

# RUN pip install torch==1.4.0+cu92 torchvision==0.5.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html
# RUN apt autoremove -y python && apt autoremove -y python3
# RUN apt update
# RUN apt install -y software-properties-common
# RUN add-apt-repository ppa:deadsnakes/ppa -y
# RUN apt-get update
# RUN apt-get install -y python3.7
# RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 10 
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 10 
#RUN alias python3='python3.8' && \
#     alias python='python3.8'
# RUN ln -s /usr/bin/python3.8 /usr/bin/python && \
#    ln -s /usr/bin/python3.8 /usr/bin/python3 
RUN apt-get -y install python3-pip

# RUN pip3 install torch===1.6.0 torchvision===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install --default-timeout=100 torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html
# RUN pip3 install --pre torch -f https://download.pytorch.org/whl/nightly/cu110/torch_nightly.html --no-cache-dir

RUN apt-get -y install cmake
RUN HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL pip3 install horovod
RUN apt-get update && apt-get install -y gcc
RUN apt-get install -y vim wget apt-utils ssh 
RUN pip3 install soundfile && \
        pip3 install unidecode && \
        pip3 install sentencepiece && \
        pip3 install editdistance  && \
        pip3 install --default-timeout=100 tensorboard_logger && \
        pip3 install --default-timeout=100 py3nvml
RUN apt-get -y install libsndfile1-dev
RUN apt-get -y install unzip && \
    apt-get -y install git
RUN wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip && \
        unzip ninja-linux.zip -d /usr/local/bin/ && \
        update-alternatives --install /usr/bin/ninja ninja /usr/local/bin/ninja 1 --force

RUN pip3 install --default-timeout=100 gpustat
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
RUN echo "set number" >> ~/.vimrc
RUN apt-get install less

# Install apex
#RUN cd /tmp && \
#    git clone https://github.com/NVIDIA/apex && \
#    cd apex && \
#    pip install --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" \
#      --global-option="--deprecated_fused_adam" --global-option="--xentropy" \
#      --global-option="--fast_multihead_attn" ./ && \
#    rm -r /tmp/apex

RUN pip3 install mpi4py

RUN pip3 install --upgrade pip

#RUN rm /usr/bin/python && \
#    ln -s /usr/bin/python3 /usr/bin/python && \
#    rm /usr/bin/pip    && \
#    ln -s /usr/bin/pip3 /usr/bin/pip && \
#    rm /usr/local/bin/pip && \
#    ln -s /usr/bin/pip3 /usr/local/bin/pip

# install the IB driver
RUN apt-get install -y libibverbs-dev

RUN pip3 install --default-timeout=100 numba==0.48
RUN pip3 install --default-timeout=100  pandas
RUN pip3 install --default-timeout=100 tensorboard
RUN pip3 install --default-timeout=100 onnxruntime
# RUN pip install onnxruntime-gpu

RUN pip3 install --default-timeout=100 pycuda

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10 

RUN pip3 install --default-timeout=100 --upgrade azureml-sdk
RUN pip3 install torch_tb_profiler

#RUN git clone https://github.com/NVIDIA/apex  && \ 
#    cd apex &&  sed -i "s/^\s\+check_cuda_torch/         #check_cuda_torch/" setup.p  &&  \
#    TORCH_CUDA_ARCH_LIST="3.7;6.0;7.0;7.5;8.0" pip3 install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./ 


CMD ["bash"]
