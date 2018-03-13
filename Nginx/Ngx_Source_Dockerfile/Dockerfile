FROM registry.aliyuncs.com/acs-sample/centos
MAINTAINER hongye.zhao@vcg.com
ADD ./ /usr/local
WORKDIR /usr/local
RUN /bin/bash ./ngx_install.sh && \
    ln -s /usr/local/nginx/nginx /usr/sbin/nginx && \
    nginx -V && nginx -v && \
    rm -f ./nginx/nginx.conf && \
    mkdir ./nginx/conf.d/ && cp ./nginx.conf ./nginx/ && \
    mkdir /var/log/nginx/
CMD nginx -g 'daemon off;'

