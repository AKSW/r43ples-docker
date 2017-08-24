FROM maven:3.5-jdk-7

RUN git clone -b master https://github.com/plt-tud/r43ples.git /var/r43ples
WORKDIR /var/r43ples
RUN mvn package
COPY data data
VOLUME /var/r43ples/data
EXPOSE 80
RUN wget http://archive.apache.org/dist/jena/binaries/apache-jena-2.7.4.tar.gz && \
  tar -xf apache-jena-2.7.4.tar.gz && \
  cd apache-jena-2.7.4/bin  && \
  ./tbdloader2 -loc ../../database/dataset ../../data/data.nq
CMD java -jar target/r43ples-0.8.8-jar-with-dependencies.jar -c data/r43ples.conf
