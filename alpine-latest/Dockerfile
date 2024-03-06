FROM pizzafactory0contorno/piatto:alpine-latest@sha256:00507a7774d31b6ea0b656e407dea9549c938177b807c6b3228df66216e78b04 as builder

ARG TARGET_ARCH
ARG EXTRA_PACKAGES

USER root

WORKDIR /build
RUN apk add --no-cache bash git gcc g++ make cmake libc-dev $EXTRA_PACKAGES
RUN git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} --depth=1 /build
RUN if [ -f ./build.bash ]; then bash ./build.bash all; else cd /tmp && cmake /build && make; fi


FROM pizzafactory0contorno/piatto:alpine-latest@sha256:00507a7774d31b6ea0b656e407dea9549c938177b807c6b3228df66216e78b04

RUN sudo mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /tmp/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
ENV PATH $PATH:/opt/bin/
