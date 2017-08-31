FROM maven:3.5-jdk-7

ENV GRAPH_URI http://example.org/

RUN git clone -b master https://github.com/plt-tud/r43ples.git /var/r43ples

WORKDIR /var/r43ples

RUN mvn package
RUN wget http://archive.apache.org/dist/jena/binaries/apache-jena-2.7.4.tar.gz && \
  tar -xf apache-jena-2.7.4.tar.gz

ADD run.sh .
COPY conf/r43ples.conf conf/r43ples.conf

VOLUME /var/r43ples
EXPOSE 80

CMD ./run.sh
