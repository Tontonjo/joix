#!/bin/sh

# Tonton Jo - 2021
echo "- Setting login screen"
sleep 10
ip=$(hostname -I | awk '{print $1}')

echo "
     ____.      .__        
    |    | ____ |__|__  ___
    |    |/  _ \|  \  \/  /
 /\__|    (  <_> )  |>    <
 \________|\____/|__/__/\_ \
                          \/
---- Welcom to Joix OS ----
Host IP: $ip
" > /etc/issue
