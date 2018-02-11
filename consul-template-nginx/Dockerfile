FROM registry.aliyuncs.com/acs-sample/centos
ADD . /root/
RUN rpm -ivh /root/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
	&& mv /root/consul-template /bin/consul-template \
	&& yum install nginx -y 
CMD /root/start.sh
