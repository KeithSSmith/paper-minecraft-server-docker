# Paper Minecraft Server Docker Host

This is a simple Dockerfile to run a PaperMC (https://papermc.io/) server inside of a Docker container.

This requires that you already have PaperMC server JAR downloaded and that you have a directory that you are going to be using as a Server Home Directory. If you are starting from scratch you will still need to accept the EULA from Minecraft, this can be done outside of this container.

Example Usage:

```
docker build --tag papermc https://github.com/KeithSSmith/paper-minecraft-server-docker.git

docker create \
  --name=minecraft \
  -e JAVA_MEMORY_START=2g \
  -e JAVA_MEMORY_MAX=2g \
  -e MINECRAFT_PORT=25565 \
  -v /path/to/server/directory:/data \
  --restart unless-stopped \
  papermc

docker start minecraft
```
