#!/bin/sh

# Tonton Jo - 2021
# Sleep is to leave time for network to configure to set ip
sleep 15
ip=$(hostname -I | awk '{print $1}')
host=$(hostname)

echo "
     ____.      .__        
    |    | ____ |__|__  ___
    |    |/  _ \|  \  \/  /
 /\__|    (  <_> )  |>    <
 \________|\____/|__/__/\_ \
                          \/
---- Welcome to Joix OS ----
Host IP:  $ip
Hostname: $host" > /etc/issue
