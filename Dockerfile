FROM maven:3.5-jdk-7

RUN git clone https://github.com/plt-tud/r43ples.git /var/r43ples
WORKDIR /var/r43ples
RUN mvn compile && mvn package
ADD data.ttl
ADD r43ples.conf
CMD java -jar target/r43ples-*-with-dependencies.jar -c r43ples.conf
