#!/bin/bash
consul_url=172.16.250.20
service nginx start
consul-template -consul=$consul_url:8500 -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:service nginx reload"
