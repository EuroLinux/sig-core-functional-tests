#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - initializing and starting PostgreSQL"

t_Log "Initialize PostgreSQL DB "
if [ "$el_ver" -ge 8 ]; then
   postgresql-setup --initdb
elif [ "$el_ver" -eq 7 ]; then
   postgresql-setup initdb
elif [ "$el_ver" -eq 6 ]; then
   service postgresql initdb
fi

t_ServiceControl postgresql start
sleep 15


 
