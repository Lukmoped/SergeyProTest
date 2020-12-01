FROM ubuntu:18.04

ARG User1=sergey

RUN useradd -m ${User1} && \
    apt-get update -yq && \
    apt-get install -yq python3-pip git && \
    apt-get clean
    
USER ${User1}

WORKDIR /home/${User1}

RUN git clone https://github.com/anfederico/Flaskex &&\
    cd Flaskex && \
    pip3 install -r requirements.txt
    
CMD  cd Flaskex && python3 app.py

EXPOSE 5000
