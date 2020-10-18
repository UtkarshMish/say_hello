FROM gcc:7.3.0

WORKDIR /
RUN apt-get -qq update
RUN apt-get -qq upgrade
RUN apt-get -qq install cmake
RUN apt-get -qq install libboost-all-dev=1.62.0.1
RUN apt-get -qq install build-essential libtcmalloc-minimal4 && \
  ln -s /usr/lib/libtcmalloc_minimal.so.4 /usr/lib/libtcmalloc_minimal.so

ADD . /app
WORKDIR /app
WORKDIR /app/build
RUN cmake ..
RUN make
CMD [ "./say_hello" ]