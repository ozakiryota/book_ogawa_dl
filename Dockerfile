########## Pull ##########
FROM nvidia/cuda:11.1.1-base-ubuntu20.04
########## Non-interactive ##########
ENV DEBIAN_FRONTEND=noninteractive
########## Common tools ##########
RUN apt-get update && \
    apt-get install -y \
	    vim \
    	wget \
    	unzip \
    	git \
		python-tk
########## PyTorch ##########
RUN apt-get update && \
    apt-get install -y \
	    python3-pip && \
	pip3 install \
		torch==1.9.0+cu111 \
		torchvision==0.10.0+cu111 \
		torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html
########## Book ##########
RUN cd ~/ && \
	git clone https://github.com/YutaroOgawa/pytorch_advanced.git
########## Jupyter ##########
RUN pip3 install jupyter && \
	echo "#!/bin/bash \n \
		cd ~/pytorch_advanced && \n \ 
		jupyter notebook --port 8000 --ip=0.0.0.0 --allow-root" \
		>> ~/pytorch_advanced/jupyter_notebook.sh &&\
	chmod +x ~/pytorch_advanced/jupyter_notebook.sh
########## Requirements ##########
RUN apt-get update && \
	apt-get install -y \
		libopencv-dev && \
	pip3 install \
		matplotlib \
		tqdm \
		opencv-python \
		pandas
########## Initial position ##########
WORKDIR /root/pytorch_advanced