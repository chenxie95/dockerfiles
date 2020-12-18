docker build -t kaldi-cuda9.0 .
docker tag kaldi-cuda9.0:latest chenxie95/kaldi-cuda9.0:latest
docker push chenxie95/kaldi-cuda9.0:latest

nvidia-docker run -it --name kaldi --mount  src=/raid/xieche/PTE,target=/workspace/,type=bind kaldi-cuda9.0:latest
extras/install_mkl.sh


nvidia-docker run -it --name kaldi_on_PTEdata --mount  src=/raid/xieche/PTE,target=/workspace/,type=bind kaldi-cuda9.0:latest
extras/install_mkl.sh
