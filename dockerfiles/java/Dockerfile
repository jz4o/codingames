FROM openjdk:11.0.2

WORKDIR /usr/src

RUN mkdir -p vendor/java/libraries
RUN wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.38/checkstyle-8.38-all.jar -O /usr/src/vendor/java/libraries/checkstyle.jar

RUN echo -n '#!/bin/bash\n\njava -jar /usr/src/vendor/java/libraries/checkstyle.jar -c /usr/src/vendor/java/checkstyle.xml /usr/src/java' > /usr/local/bin/checkstyle && \
    chmod +x /usr/local/bin/checkstyle

