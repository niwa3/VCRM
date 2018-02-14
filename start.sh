#!/bin/bash
cd /VCRM
service postgresql start
su postgres -c "\
psql -f createuser.sql;\
psql -f createslavedb.sql;\
"
cd ..
tspawn new slave
cd slave
cp ../VCRM/config/database.ini ./config
tspawn scaffold relationship
tspawn scaffold customer_info
tspawn scaffold vender_info
tspawn scaffold device_info
tspawn scaffold service_info
tspawn scaffold login_info
cp -rf ../VCRM/controllers .
cp -rf ../VCRM/models .
cp -rf ../VCRM/views .
cp -rf ../VCRM/models .
qmake -r "CONFIG+=debug"
make
treefrog -d -e dev
