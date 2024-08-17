FROM pizzafactory0contorno/piatto:alpine-latest@sha256:be0fee590e214f73d7fad87226f65defd463151de08aa589a1208fe3ae072b26 as builder

ARG TARGET_ARCH
ARG EXTRA_PACKAGES

USER root

WORKDIR /build
RUN apk add --no-cache bash git gcc g++ make cmake libc-dev $EXTRA_PACKAGES
RUN git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} --depth=1 /build
RUN if [ -f ./build.bash ]; then bash ./build.bash all; else cd /tmp && cmake /build && make; fi


FROM pizzafactory0contorno/piatto:alpine-latest@sha256:be0fee590e214f73d7fad87226f65defd463151de08aa589a1208fe3ae072b26

RUN sudo mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /tmp/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
ENV PATH $PATH:/opt/bin/
