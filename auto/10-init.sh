#! /bin/bash

psql -p 5432 -h 127.0.0.1 -U postgres -d bcs -a -f /super_rotech.sql
psql -p 5432 -h 127.0.0.1 -U rotechnology -d bcs -a -f /tabelle.sql
