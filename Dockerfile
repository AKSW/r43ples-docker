FROM maven:3.5-jdk-7

RUN git clone -b develop https://github.com/plt-tud/r43ples.git /var/r43ples

WORKDIR /var/r43ples

RUN mvn package -DskipTests
RUN wget http://archive.apache.org/dist/jena/binaries/apache-jena-2.7.4.tar.gz && \
  tar -xf apache-jena-2.7.4.tar.gz

RUN mkdir -p /var/r43ples/database/dataset
ADD run.sh .
COPY conf/r43ples.conf conf/r43ples.conf

VOLUME /var/r43ples
EXPOSE 80

CMD ./run.sh
