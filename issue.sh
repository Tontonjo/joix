!#bin/sh
echo "#!/bin/sh -e \n/root/joix_startup.sh \nrm -f /etc/rc.local \nexit 0" > /etc/rc.local
