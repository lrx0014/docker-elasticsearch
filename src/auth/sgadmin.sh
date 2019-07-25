#!/bin/bash

sgadmin(){
    chmod +x /elasticsearch/plugins/search-guard-6/tools/sgadmin.sh
    /elasticsearch/plugins/search-guard-6/tools/sgadmin.sh \
    -cd /elasticsearch/config/certs \
    -ks /elasticsearch/config/certs/es-route-keystore.jks \
    -ts /elasticsearch/config/certs/truststore.jks \
    -cn $CLUSTER_NAME \
    -kspass $KS_PWD \
    -tspass $TS_PWD \
    -h $ES_HOST \
    -nhnv
}

sgadmin
