FROM openjdk:11 AS build

ENV JAVA_MEMORY_START=1g
ENV JAVA_MEMORY_MAX=2g
ENV JAVA_OPTS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-OmitStackTraceInFastThrow -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=8 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=true -Daikars.new.flags=true"
ENV MINECRAFT_PORT=25565
ENV JAR_FILE_NAME=paper.jar

VOLUME [ "/data" ]

EXPOSE ${MINECRAFT_PORT}/tcp
EXPOSE ${MINECRAFT_PORT}/udp

WORKDIR /data

ENTRYPOINT /usr/local/openjdk-11/bin/java -Xms${JAVA_MEMORY_START} -Xmx${JAVA_MEMORY_MAX} ${JAVA_OPTS} -jar /data/${JAR_FILE_NAME}} --nojline nogui
