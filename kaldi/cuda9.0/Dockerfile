FROM chenxie95/rnnt-cuda9.0:latest 
USER root

RUN apt update
RUN apt-get -y install wget

RUN apt-get -y install zlib1g-dev git sox gfortran subversion libtool 
RUN apt-get -y install flac
RUN apt-get -y install automake autoconf python2.7

RUN mkdir /workspace/ && \
    cd /workspace && \
    git clone https://github.com/kaldi-asr/kaldi.git && \
    cd kaldi/tools && \
    ./extras/install_mkl.sh && \
    make && \
    cd ../src &&\
    ./configure --shared && \
    make depend -j 8 && \
    make -j 8 


CMD ["bash"]
