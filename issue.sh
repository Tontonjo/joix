#!/bin/sh

# Tonton Jo - 2021
sleep 10
ip=$(hostname -I | awk '{print $1}')
host=$(hostname)

echo "
     ____.      .__        
    |    | ____ |__|__  ___
    |    |/  _ \|  \  \/  /
 /\__|    (  <_> )  |>    <
 \________|\____/|__/__/\_ \
                          \/
---- Welcom to Joix OS ----
Host IP:  $ip
Hostname: $host" > /etc/issue
