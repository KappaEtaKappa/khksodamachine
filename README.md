Soda machine RFID program built with NodeJS

===DATABASE===
The soda machine uses a RethinkDB to keep track of purchases made by members
of KHK with their Wiscards.
- Contains two tables (members and purchases)
- Run via rethinkdb --directory /home/admin/rethinkdb1
- Can access administration tools at kappa on port 8080
- Set up as a systemd service on kappa in /etc/systemd/system/rethink.service

===SODASERVER===
- Sets up connection between Arduino Uno inside the soda machine and
  kappa
- Run via /home/admin/soda-machine/bin/sodaserver
- Set up as a systemd service on kappa in /etc/systemd/system/sodaserver.service
- Note: The systemd service calls a script that uses a time delay to make sure
  dependencies are running when the sodaserver binary is called

===WWW===
- Creates a simple HTML output for purchase amounts made by each member on a
  monthly basis
- Accessed on kappa on port 8082
- Set up as a systemd service on kappa in /etc/systemd/system/sodawww.service

===CHATEAU===
- GUI tool to make managing the RethinkDB easier
- Accessed at kappa on port 8081
- Set up as a systemd service on kappa in /etc/systemd/system/chateau.service

Note: For security purposes, the ports that chateau and the database web
administration tools run on (8081 and 8082) can only be accessed via a socks
proxy. See https://www.rethinkdb.com/docs/security/ for details.
