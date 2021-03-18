FROM ubuntu:18.04
USER root

RUN apt-get update -y
ENV OPENMPI_VERSION=4.0

# install openmpi
RUN apt-get -y install g++
RUN apt-get -y install make
RUN apt-get -y install wget
RUN apt-get install -y apt-utils
ENV OPENMPI_STRING=openmpi-${OPENMPI_VERSION}.0
RUN mkdir /tmp/openmpi && \
        cd /tmp/openmpi && \
        wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.0.tar.gz && \
        tar zxf ${OPENMPI_STRING}.tar.gz && \
        cd ${OPENMPI_STRING} && \
        ./configure  --prefix /usr/local/mpi && \
        make -j 4 all && \
        make install && \
        ldconfig && \
        rm -rf /tmp/openmpi && \
        test -f /usr/local/mpi/bin/mpic++  # Sanity check
ENV PATH /usr/local/mpi/bin:$PATH

RUN apt-get -y install cmake
RUN apt-get -y install python3-pip
RUN pip3 install mpi4py
RUN apt-get -y install less
RUN apt-get -y install git
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
RUN echo "set number" >> ~/.vimrc

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10 

CMD ["bash"]
