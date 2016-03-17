#!/bin/sh

/usr/bin/nohup /usr/bin/rethinkdb --directory /home/admin/soda-machine/rethinkdb1 --http-port 5000 --bind all &
/usr/bin/nohup /home/admin/soda-machine/bin/sodaserver &
/usr/bin/nohup /home/admin/soda-machine/bin/www &
/usr/bin/nohup /usr/bin/chateau -f /home/admin/soda-machine/config.js -p 5002 &
