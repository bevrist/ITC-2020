FROM mysql:8.0.1

#install nc for watching for db uptime
RUN apt-get update \
    && apt-get install netcat -y \
    && rm -rf /var/lib/apt/lists/*

# copy files and execute setup-mySQL.sh in beginning of mySQL entrypoint script
COPY ./ ./
RUN chmod 700 setup-mySQL.sh \
    && sed -i 's/^M$//g' setup-mySQL.sh \
    && sed '1a ./setup-mySQL.sh &' entrypoint.sh > entrypoint-mod.sh \
    && cp entrypoint-mod.sh entrypoint.sh \
    && rm entrypoint-mod.sh

CMD ["--secure-file-priv=images"]
