#/bin/bash
set -e
APPDIR="/usr/local"

yum install -y unzip patch gcc gcc-c++ autoconf automake make 

cd $APPDIR
#wget https://codeload.github.com/yaoweibin/nginx_upstream_check_module/zip/master && mv master nginx_upstream_check_module-master.zip
#wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.41.tar.gz
#wget http://www.zlib.net/zlib-1.2.11.tar.gz
#wget http://distfiles.macports.org/openssl/openssl-1.0.2n.tar.gz
#wget http://nginx.org/download/nginx-1.12.2.tar.gz

#unzip
tar zxf pcre-8.41.tar.gz
tar zxf zlib-1.2.11.tar.gz
tar zxf openssl-1.0.2n.tar.gz
tar zxf nginx-1.12.2.tar.gz
unzip nginx_upstream_check_module-master.zip

#install
cd $APPDIR/pcre-8.41
./configure && make && make install
[ $? -eq 0 ] && echo "#########  one step : install pcre ok  #########"
cd $APPDIR/zlib-1.2.11
./configure && make && make install
[ $? -eq 0 ] && echo "#########  two step : install zlib ok  #########"
 cd $APPDIR/openssl-1.0.2n
./config && make && make install
[ $? -eq 0 ] && echo "#########  three step : install openssl ok  #########"

cd $APPDIR/nginx-1.12.2
patch -p1 < ../nginx_upstream_check_module-master/check_1.12.1+.patch

./configure --sbin-path=$APPDIR/nginx/nginx \
--conf-path=$APPDIR/nginx/nginx.conf \
--pid-path=$APPDIR/nginx/nginx.pid \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-pcre=$APPDIR/pcre-8.41 \
--with-zlib=$APPDIR/zlib-1.2.11 \
--with-openssl=$APPDIR/openssl-1.0.2n \
--add-module=../nginx_upstream_check_module-master/
make && make install
[ $? -eq 0 ] && echo "################## install nginx ok ##################"
