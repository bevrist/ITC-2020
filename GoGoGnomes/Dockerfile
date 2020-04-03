# use the official python3 image as base
FROM python:3

#move the app files into the container at location /app/<Files-Here>
COPY . /app

#effectively the same as `cd /app/goGoGnomes`
WORKDIR /app

#update container & install dependencies
RUN apt-get update && apt-get -y upgrade \
    && apt-get install netcat -y \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

#make entrypoint.sh the new command run at startup
RUN chmod 700 entrypoint.sh
CMD ./entrypoint.sh

#this does nothing, just here to let user know this port is meant to be used
EXPOSE 8000