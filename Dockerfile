FROM tensorflow/tensorflow:latest-gpu

#RUN add-apt-repository universe
RUN pip3 install --upgrade pip

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

#############
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get clean autoclean -y && apt-get autoremove -y

RUN apt-get install -y ffmpeg libsm6 libxext6 libgl1-mesa-glx cmake git

#Python Пакеты для работы с нейронками

RUN pip install numpy scipy matplotlib pandas scikit-learn tqdm
RUN pip install xlsxwriter ipython notebook

RUN pip install jupyterlab ipywidgets
RUN pip install xlwt xlrd
RUN pip install opencv-python


WORKDIR /home

