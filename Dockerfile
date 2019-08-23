FROM alpine:3.10

# Java Version and other ENV
ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=221 \
    JAVA_VERSION_BUILD=11 \
    JAVA_PACKAGE=server-jre \
    JAVA_PACKAGE_VARIANT=nashorn \
    JAVA_JCE=standard \
    JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc/releases/download \
    GLIBC_VERSION=2.30-r0 \
    LANG=de_DE.UTF-8 \
    LC_ALL=de_DE.UTF-8 \
    LANGUAGE=de_DE.UTF-8 \
    LC_CTYPE=de_DE.UTF-8 \
    LC_COLLATE=de_DE.UTF-8 \
    LC_MESSAGES=de_DE.UTF-8 \
    LC_NUMERIC=de_DE.UTF-8 \
    LC_TIME=de_DE.UTF-8 \
    LC_MONETARY=de_DE.UTF-8 \
    LC_PAPER=de_DE.UTF-8 \
    LC_IDENTIFICATION=de_DE.UTF-8 \
    LC_NAME=de_DE.UTF-8 \
    LC_ADDRESS=de_DE.UTF-8 \
    LC_TELEPHONE=de_DE.UTF-8 \
    LC_MEASUREMENT=de_DE.UTF-8 \
    TZ=Europe/Berlin
    

# do all in one step
RUN apk add --update --no-cache libstdc++ curl ca-certificates bash java-cacerts wget && \
    wget -P /tmp ${GLIBC_REPO}/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    wget -P /tmp ${GLIBC_REPO}/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    wget -P /tmp ${GLIBC_REPO}/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk && \
    apk add --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    find / -name localedef
    
   
