#!/bin/bash

asadmin delete-jdbc-resource jdbc/mycompanyDataSource
asadmin delete-jdbc-connection-pool jdbc/mycompanyPool

asadmin create-jdbc-connection-pool\
  --datasourceclassname org.postgresql.ds.PGSimpleDataSource\
  --restype javax.sql.DataSource\
  --isconnectvalidatereq=true\
  --validationmethod auto-commit\
  --ping true\
  --property "ServerName=127.0.0.1:User=${USER}:Password=letmein:PortNumber=5432:DatabaseName=${USER}_PRIMEFACES_DEV" jdbc/mycompanyPool
asadmin create-jdbc-resource --connectionpoolid jdbc/mycompanyPool jdbc/mycompanyDataSource
