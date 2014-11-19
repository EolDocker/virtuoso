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
    -v /virtuoso_db:/usr/local/var/lib/virtuoso/db virtuoso:7.1.0

## Set a password:

    isql -H <virtuoso-container-ip> exec='set password dba abetterpassword;'

## GRANT PERMISSIONS

    isql 11111 dba abetterpassword -H
    exec='grant SPARQL_UPDATE to "SPARQL";'
    GRANT EXECUTE ON SPARUL_CLEAR TO "SPARQL"
    GRANT EXECUTE ON DB.DBA.SPARUL_DROP TO "SPARQL";
    GRANT DELETE ON DB.DBA.RDF_QUAD TO "SPARQL";
    GRANT EXECUTE ON DB.DBA.SPARQL_INSERT_DICT_CONTENT TO "SPARQL";
    GRANT EXECUTE ON DB.DBA.SPARQL_DELETE_DICT_CONTENT TO "SPARQL";

