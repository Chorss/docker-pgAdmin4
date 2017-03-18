**pgAdmin4 in docker container - Version 1.3**
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

`$ docker run -d -p 5050:5050 -v /home/user/data:/data chorss/docker-pgadmin4`

**Data Storage Outside of the Container**
-

`-v /my/local/directory:/data` to the docker run command.
This will store session, configuration and storage.