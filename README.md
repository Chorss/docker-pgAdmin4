**pgAdmin4 in docker container - Version 4.7**
-

[![](https://images.microbadger.com/badges/image/chorss/docker-pgadmin4.svg)](https://microbadger.com/images/chorss/docker-pgadmin4) [![](https://img.shields.io/docker/pulls/chorss/docker-pgadmin4.svg)](https://microbadger.com/images/chorss/docker-pgadmin4) [![](https://images.microbadger.com/badges/version/chorss/docker-pgadmin4.svg)](https://microbadger.com/images/chorss/docker-pgadmin4)

|          NAME          | Data Type  | REQUIRED                       |
|------------------------|------------|--------------------------------|
| SERVER_PORT            | Integer    | NO                             |
| SERVER_MODE            | Boolean    | YES                            |
| PGADMIN_SETUP_EMAIL    | String     | NO*                            |
| PGADMIN_SETUP_PASSWORD | String     | NO*                            |
| MAIL_SERVER            | String     | NO*                            |
| MAIL_PORT              | Integer    | NO*                            |
| MAIL_USE_SSL           | Boolean    | NO*                            |
| MAIL_USE_TLS           | Boolean    | NO*                            |
| MAIL_USERNAME          | String     | NO*                            |
| MAIL_PASSWORD          | String     | NO*                            |
| UID                    | Integer    | NO                             |
| GID                    | Integer    | NO                             |

`*` -> if SERVER_MODE set false

Example commands
-

**Quick start**

`$ docker run -d -p 5050:5050 chorss/docker-pgadmin4`

`$ docker run -d -p 5050:5050 -v $HOME/mydata:/data chorss/docker-pgadmin4`

**Data storage outside of the container**

 This will store session, configuration and storage on the given volume.
 The application user within the container will change it's uid/gid to the
 given values and will use this uid/gid to write to the volume-directory.


`docker run -d -p 5050:5050 -e UID=2301 -e GID=2301 -v $HOME/mydata:/data chorss/docker-pgadmin4`

On most shells, you can run with the UID/GID of the current user like this

    docker run -d -p 5050:5050 -e UID=`id -u` -e GID=`id -g` -v $HOME/mydata:/data chorss/docker-pgadmin4

 **Remember to create `$HOME/mydata` before running the command above.**
