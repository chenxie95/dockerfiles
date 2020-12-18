FROM openmpi3.1-cudnn7.0-pytorch-1.1
USER root

RUN apt-get install -y vim

RUN mkdir /tmp/apex && \
		cd /tmp/apex && \
		git clone https://github.com/NVIDIA/apex.git &&\
		cd apex && \
		python setup.py install --cuda_ext --cpp_ext
RUN pip install boto3 regex
RUN curl http://j.mp/spf13-vim3 -L -o - | sh
RUN pip install spacy ftfy==4.4.3
RUN python -m spacy download en
RUN pip install pathlib
RUN apt-get update && apt-get install -y cifs-utils
