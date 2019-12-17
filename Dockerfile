#Application Security
#Andrew Vittetoe
#02DEC2019
#Assignment #4



# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM python:3.7-slim-stretch
# Needed for one of the libraries
#FROM gcc:6.5.0 

# If you prefer miniconda:
#FROM continuumio/miniconda3

#LABEL Name=python Version=0.0.1
EXPOSE 8080

WORKDIR C:/Users/RAZER-MAN/OneDrive/NYU/Classes/"Application Security"/Assignments/"Python Programming"
ADD . /app.py
ADD requirements.txt .
ADD /templates/history.html .
ADD /templates/layout.html .
ADD /templates/login_history.html .
ADD /templates/login.html .
ADD /templates/nav.html .
ADD /templates/query.html .
ADD /templates/register.html .
ADD /templates/spell_check.html .

# Using pip:
RUN python -m pip install -r requirements.txt
#RUN update-alternatives --install /usr/bin/$(gcc -dumpmachine)-gcc $(gcc -dumpmachine)-gcc /usr/bin/gcc 60 --slave /usr/bin/$(gcc -dumpmachine)-g++ $(gcc -dumpmachine)-g++ /usr/bin/g++
CMD ["python", "-m", "./app"]

# Using pipenv:
#RUN python3 -m pip install pipenv
#RUN pipenv install --ignore-pipfile
#CMD ["pipenv", "run", "python3", "-m", "app"]

# Using miniconda (make sure to replace 'myenv' w/ your environment name):
#RUN conda env create -f environment.yml
#CMD /bin/bash -c "source activate myenv && python3 -m app"

# COPY requirements.txt /
# RUN pip install --no-cache-dir -U pip
# RUN pip install --no-cache-dir -r /requirements.txt
