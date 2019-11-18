FROM nvidia/cuda:9.0-cudnn7-devel
#ENV TZ=Europe/Paris
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#ENV HTTPS_PROXY=http://emea.zscaler.philips.com:9480
#ENV https_proxy=http://emea.zscaler.philips.com:9480
#ENV HTTP_PROXY=http://emea.zscaler.philips.com:9480
#ENV http_proxy=http://emea.zscaler.philips.com:9480
#RUN apt-get update && apt-get install -y --no-install-recommends \
#            libcudnn7=$CUDNN_VERSION-1+cuda10.0 \
#            libcudnn7-dev=$CUDNN_VERSION-1+cuda10.0 && \
#    apt-mark hold libcudnn7 && \
#    rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install software-properties-common -y 
RUN  add-apt-repository ppa:fkrull/deadsnakes &&  apt-get update && apt-get install git python-pip python3-pip python3.6-dev python3-tk libgtk2.0-dev tmux wget libcurl4-gnutls-dev python-dev curl vim-nox --allow-change-held-packages -y 
COPY pip3_req.txt pip3_req.txt
COPY .tmux.conf /root/
RUN git clone https://github.com/dmitrysarov/vim_install.git && cd vim_install && ./install_vim.sh && ./config.sh && cd - && rm -r vim_install
COPY jupyter_config /root/.jupyter/jupyter_notebook_config.json
RUN apt-get update && apt-get install libcurl4-gnutls-dev -y
#COPY kaggle.json /root/.kaggle/kaggle.json 
RUN python3 -m pip install --upgrade pip && python3 -m pip install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension
#RUN pip3 install https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl && pip3 install torchvision
RUN python3 -m pip install --upgrade pip && python3 -m pip install --no-binary :all:  --no-cache-dir cython  
RUN python3 -m pip install --upgrade pip && python3 -m pip install -r pip3_req.txt  
ENV TERM=screen-256color
ENV VISUAL=vim
ENV EDITOR="$VISUAL"
RUN set -o vi
