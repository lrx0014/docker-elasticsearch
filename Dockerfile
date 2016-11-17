FROM elasticsearch:5.0

MAINTAINER Guillaume Simonneau <simonneaug@gmail.com>
LABEL Description="elasticsearch x-pack shield marvel watcher graph"

## install modules
RUN bin/elasticsearch-plugin install x-pack --batch

COPY config/elasticsearch.yml /.backup/config/elasticsearch.yml

ENV ELASTIC_PWD="changeme" \
    KIBANA_PWD="changeme" \
    LOGSTASH_PWD="changeme" \
    BEATS_PWD="changeme" \
    HEAP_SIZE="1g" \ 
    CONF_DIR="/etc/elasticsearch/config"

ADD ./src/ /run/
RUN chmod +x -R /run/

VOLUME /etc/elasticsearch/config
VOLUME /data

ENTRYPOINT ["/run/entrypoint.sh"]
CMD ["elasticsearch"]
