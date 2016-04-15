FROM python:2.7.11
MAINTAINER Windfarer <windfarer@gmail.com>

RUN apt-get update && apt-get install libmagickwand-dev

ADD . /calibre_web
WORKDIR /calibre_web
RUN pip install -r app/requirements.txt

EXPOSE 5000

ENTRYPOINT ["gunicorn", "-w 4", "-b 0.0.0.0:5000", "app:app"]
