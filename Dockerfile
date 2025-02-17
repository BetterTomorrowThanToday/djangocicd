FROM --platform=linux/arm64 python:3.10.12 as build

RUN apt-get update

RUN apt-get install -y --no-install-recommends

RUN rm -rf /var/lib/apt//lists/*

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]

