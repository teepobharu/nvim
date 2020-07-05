|-------------------------------------------------------------|--------------------------------------------------------|
| COMMANDS                                                    | DESCRIPTION                                            |
|-------------------------------------------------------------|--------------------------------------------------------|
| docker pull <image_source>                                  | Pull image from the given source                       |
|-------------------------------------------------------------|--------------------------------------------------------|
| docker run -p <host>:<container> -d <image_id_or_name>      | Run container from image                               |
|                                                             | -d = detach mode run in bg                             |
|                                                             | -p = port mapping between host:container               |
|-------------------------------------------------------------|--------------------------------------------------------|
| docker exec -it <container_id_or_name> <shell>              | Run command on the running container                   |
|                                                             | -i = keep STDIN open                                   |
|                                                             | -t Allocate psuedo-TTY                                 |
|-------------------------------------------------------------|--------------------------------------------------------|
| docker commit <container_id_or_name> <image-name>:<version> | Create docker image from container with                |
|                                                             | the given name and version                             |
|-------------------------------------------------------------|--------------------------------------------------------|
| docker login <server>                                       | Login to given server OR dockerhub registry by default |
|-------------------------------------------------------------|--------------------------------------------------------|
| docker push <image-name>:<version>                          | Push image to the registry source                      |
|                                                             | - If version not give will be tag as latest            |
|-------------------------------------------------------------|--------------------------------------------------------|


|-------------|--------------------------------------------------------------------------|
| Steps #     | What it does?                                                            |
|-------------|--------------------------------------------------------------------------|
| 1 - FROM    | Starts with base image SQL Server                                        |
| 2 - ENV     | Set environment variables needed to setup SQL Server                     |
| 3 - WORKDIR | Create new folder inside docker and use that directory for other command |
| 4 - COPY    | Copy auto generated data sql scripts to src folder                       |
| 5 - RUN     | startup sqlserver and execute sqlcommand to run filldata.sql script      |
|-------------|--------------------------------------------------------------------------|


| Commmands  | Flags  | What id does?                                                        |
|------------|--------|----------------------------------------------------------------------|
| docker run | -d     | detach - run in background                                           |
|            | -h     | set hostname that can be used by other container not by host machine |
|            | --name | set container name                                                   |
|            | -e     | set environment variable for the container                           |
