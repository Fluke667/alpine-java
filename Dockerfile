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
    LANG=UTF-8 \
    LC_ALL=UTF-8 \
    LANGUAGE=UTF-8 \
    LC_CTYPE=UTF-8 \
    LC_COLLATE=UTF-8 \
    LC_MESSAGES=UTF-8 \
    LC_NUMERIC=UTF-8 \
    LC_TIME=UTF-8 \
    LC_MONETARY=UTF-8 \
    LC_PAPER=UTF-8 \
    LC_IDENTIFICATION=UTF-8 \
    LC_NAME=UTF-8 \
    LC_ADDRESS=UTF-8 \
    LC_TELEPHONE=UTF-8 \
    LC_MEASUREMENT=UTF-8
    

# do all in one step
RUN apk add --update --no-cache libstdc++ curl ca-certificates bash java-cacerts wget && \
    wget -P /tmp ${GLIBC_REPO}/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    wget -P /tmp ${GLIBC_REPO}/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    wget -P /tmp ${GLIBC_REPO}/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk && \
    apk add --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    /usr/glibc-compat/bin/localedef --help
