FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04
# FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

########## nvidia-docker1 hooks ##########
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}
########## BASIS ##########
RUN apt-get update && apt-get install -y \
	vim \
	wget \
	unzip \
	git \
	build-essential
########## PyTorch ##########
RUN apt-get update && \
	apt-get install -y \
		python3-pip && \
	pip3 install --upgrade pip && \
	pip3 install \
		torch==1.0.0 \
		torchvision==0.2.1
		# torch==1.1.0 \
		# torchvision==0.3.0
########## Book "pytorch_advanced" ##########
RUN cd /home && \
	git clone https://github.com/YutaroOgawa/pytorch_advanced
########## Jupyter Notebook ##########
RUN pip3 install jupyter && \
	echo "#!/bin/bash \n \
		cd /home/pytorch_advanced && \n \ 
		jupyter notebook --port 8000 --ip=0.0.0.0 --allow-root" \
		>> /home/jupyter_notebook.sh &&\
	chmod +x /home/jupyter_notebook.sh
########## Requirements ##########
RUN apt-get update && \
	apt-get install -y \
		libopencv-dev && \
	pip3 install \
		matplotlib \
		tqdm \
		opencv-python \
		pandas
######### initial position ##########
WORKDIR /home
