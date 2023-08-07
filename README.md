# sample-docker
Group of docker images with preloaded configurations and/or data

## Databases

### Postgres

#### DVD Rental

[Reference link](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)  
Inside the above link, there is description of the data along with a link to download the zip file mentioned below.

Files found under [here](database/postgres/dvdrental/data/dump) are from running these commands:  
```shell
unzip dvdrental.zip -d database/postgres/dvdrental/data/dump
cd database/postgres/dvdrental/data/dump
tar -x -f dvdrental.tar
rm dvdrental.tar
```
