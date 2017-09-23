FROM ubuntu:16.04

# installation according to kaldi/INSTALL instructuin

RUN apt-get update && apt-get install -y git \
    # tools deps
    zlib1g-dev make automake autoconf bzip2 wget libtool subversion libatlas3-base g++ python2.7 python3

RUN git clone https://github.com/kaldi-asr/kaldi build

# build tools
RUN cd /build && cd tools && make -j 4

# build scr, http://kaldi-asr.org/doc/build_setup.html
# to remove debug and make faster runnable, change kaldi.mk after configure
RUN cd /build/src && ./configure --shared && make depend -j 4 && make -j 4