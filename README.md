**pgAdmin4 in docker container - Version 1.6**
-

|          NAME          |      VARIABLE     | REQUIRED                       |
|------------------------|-------------------|--------------------------------|
| DEFAULT_SERVER_PORT    | 5050              | NO                             |
| SERVER_MODE            | True or False     | YES                            |
| PGADMIN_SETUP_EMAIL    | username@mail.tld | NO (IF SERVER_MODE SET FALSE)  |
| PGADMIN_SETUP_PASSWORD | password          | NO (IF SERVER_MODE SET FALSE)  |
| MAIL_SERVER            | mail.example.tld  | NO (IF SERVER_MODE SET FALSE)  |
| MAIL_PORT              | 465               | NO (IF SERVER_MODE SET FALSE)  |
| MAIL_USE_SSL           | True              | NO (IF SERVER_MODE SET FALSE)  |
| MAIL_USERNAME          | username          | NO (IF SERVER_MODE SET FALSE)  |
| MAIL_PASSWORD          | password          | NO (IF SERVER_MODE SET FALSE)  |


Example docker command

Quick start

`$ docker run -d -p 5050:5050 chorss/docker-pgadmin4`

`$ docker run -d -p 5050:5050 -v /home/user/data:/data chorss/docker-pgadmin4`


**Backup and Restore in pgAdmin4 (pg_dump, pg_restore)**

To use restore and backup you need to set the path

`File -> Preferences -> Binary` the paths set to `/usr/bin`

**Data Storage Outside of the Container**

 This will store session, configuration and storage.
 
`docker run -d -p 5050:5050 -v /home/user/data:/data chorss/docker-pgadmin4`