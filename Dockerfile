FROM maven:3.5-jdk-7

RUN git clone https://github.com/plt-tud/r43ples.git /var/r43ples
WORKDIR /var/r43ples
RUN mvn package -Dmaven.test.skip=true
COPY data data
VOLUME /var/r43ples/data
EXPOSE 80
ADD run.sh .
CMD ./run.sh
