#!/bin/bash

# this file is mostly meant to be used by the author himself.

ragel -I src -G2 src/ngx_http_redis2_reply.rl || exit 1

root=`pwd`
version=$1
home=~
force=$2

          #--with-cc-opt="-O3" \
          #--with-cc-opt="-fast" \
ngx-build $force $version \
            --with-cc-opt="-O3 -funsigned-char" \
          --with-http_addition_module \
          --add-module=$root $opts \
          --add-module=$root/../eval-nginx-module \
          --add-module=$root/../echo-nginx-module \
          --add-module=$root/../ndk-nginx-module \
          --add-module=$root/../set-misc-nginx-module \
          --add-module=$root/../lua-nginx-module \
          --add-module=$home/work/nginx/ngx_http_upstream_keepalive-c6396fef9295 \
          --with-debug
          #--add-module=$root/../eval-nginx-module \
          #--add-module=$home/work/nginx/nginx_upstream_hash-0.3 \
  #--without-http_ssi_module  # we cannot disable ssi because echo_location_async depends on it (i dunno why?!)

