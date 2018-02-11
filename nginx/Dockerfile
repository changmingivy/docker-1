FROM registry.aliyuncs.com/acs-sample/centos
MAINTAINER zhy <hongye.zhao@vcg.com>
ADD . /root/
RUN rpm -ivh /root/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
    && yum install nginx -y \
    && rm -f /etc/nginx/conf.d/default.conf && cp /root/default.conf /etc/nginx/conf.d/default.conf
CMD /usr/sbin/nginx -g "daemon off;
