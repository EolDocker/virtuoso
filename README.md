docker-virtuoso
===============

A Dockerized Virtuoso for EOL

```
$ docker build -t virtuoso:7.1.0 .
```

## Start a container

To persist the data on the host's filesystem, create a directory
(eg: `/virtuoso_db`), copy the `virtuoso.ini` in it and run the contaner:

To run EOL TraitBank:

    wget http://opendata.eol.org/eol_virtuoso/current/db.tar.gz
    tar zxvf db.tar.gz
    mv db /virtuoso_db

Then you can start the container:

    docker run -d -p 8890:8890 -p 1111:1111 --name virtuoso \
    -v /virtuoso-db:/opt/virtuoso/var/lib/virtuoso/db virtuoso:7.1.0

## Set a password:

    isql -H <virtuoso-container-ip> exec='set password dba abetterpassword;'

## Enable SPARQL_UPDATE

    isql -P abetterpassword -H <virtuoso-container-ip> exec='grant SPARQL_UPDATE to "SPARQL";'

