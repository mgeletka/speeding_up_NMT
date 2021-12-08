FROM python:3.8-slim-buster


COPY . .


## Create python environment and activate it
#RUN python3 -m venv venv
#RUN source venv/bin/activate
RUN apt-get -y update
RUN apt-get -y install git
RUN apt install -y g++
### Install  python requirements
RUN pip3 install -r requirements.txt

CMD [ "python3", "app.py"]


