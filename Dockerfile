FROM maven:3.6.3-openjdk-15 as vendor

WORKDIR /var/www/jicofo

COPY . .

RUN mvn install -Dassembly.skipAssembly=false -DskipTests

FROM jitsi/jicofo:stable-4857

COPY --from=vendor /var/www/jicofo/target/jicofo-1.1-SNAPSHOT.jar /usr/share/jicofo/jicofo.jar
COPY sip-communicator.properties /defaults/sip-communicator.properties