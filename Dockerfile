FROM ghcr.io/sammcb/swift:latest

ARG VAPOR_VER=18.3.0
ARG VAPOR_DIR=opt

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	make \
	sudo \
	ca-certificates

WORKDIR /${VAPOR_DIR}
RUN git clone https://github.com/vapor/toolbox.git
WORKDIR /${VAPOR_DIR}/toolbox
RUN git checkout ${VAPOR_VER}
RUN make install
WORKDIR /root
