# Use the official Ubuntu 20.04 image as the base
FROM tuftsttsrt/openmpi:4.1.7
 
## Download and install raxml-ng
RUN apt-get update \
    && apt-get install -y flex bison libgmp3-dev \
    && apt-get clean && apt-get purge \
	&& rm -rf /var/lib/apt/lists/*  /var/tmp/*

RUN cd /opt && wget https://github.com/amkozlov/raxml-ng/archive/refs/tags/1.2.2.tar.gz \
    && tar -xvf 1.2.2.tar.gz \
    && raxml-ng-1.2.2 \
    && mkdir build && cd build \
    && cmake -DUSE_MPI=ON ..
    && make \
    && make install