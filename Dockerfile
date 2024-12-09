# Use the official Ubuntu 20.04 image as the base
FROM tuftsttsrt/openmpi:4.1.7
 
## Download and install raxml-ng
RUN apt-get update \
    && apt-get install -y ca-certificates libgtest-dev flex bison libgmp3-dev \
    && apt-get clean && apt-get purge \
        && rm -rf /var/lib/apt/lists/*  /var/tmp/*

RUN cd /opt && git clone --recursive https://github.com/amkozlov/raxml-ng \
    && cd raxml-ng \
    && mkdir build && cd build \
    && cmake -DUSE_MPI=ON .. \
    && make \
    && make install
