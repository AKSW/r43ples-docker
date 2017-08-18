FROM maven:3.5-jdk-7

RUN git clone https://github.com/plt-tud/r43ples.git /var/r43ples
WORKDIR /var/r43ples
RUN mvn compile && mvn package
COPY data data
VOLUME /var/r43ples/data
EXPOSE 9998
CMD java -jar target/r43ples-0.8.8-jar-with-dependencies.jar -c data/r43ples.conf
