CREATE DATABASE LINK link_to_dbs1
CONNECT TO user_wro IDENTIFIED BY "oracle"
USING '(DESCRIPTION=
         (ADDRESS=(PROTOCOL=TCP)(HOST=46.60.16.247)(PORT=1539))
         (CONNECT_DATA=(SERVICE_NAME=freepdb1))
       )';

