FROM fluke667/alpine

ADD https://download.java.net/java/early_access/alpine/8/binaries/openjdk-14-ea+8_linux-x64-musl_bin.tar.gz $JAVA_HOME/openjdk.tar.gz  
RUN tar --extract --file $JAVA_HOME/openjdk.tar.gz --directory "$JAVA_HOME" --strip-components 1; \  
    rm $JAVA_HOME/openjdk.tar.gz;
# jdeps can help identify which modules an application uses
RUN ["jlink", "--compress=2", \  
     "--module-path", "/opt/jdk/jmods/", \
     "--add-modules", "java.base,java.logging,java.naming,java.xml,jdk.sctp,jdk.unsupported", \
     #"--no-header-files", "--no-man-pages", \
     "--output", "/javarun"]
