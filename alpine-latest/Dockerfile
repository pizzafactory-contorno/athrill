FROM pizzafactory0contorno/piatto:alpine-latest@sha256:a7c672e88b4fe9d2783f52c10f24608c1fd48b7bd4e0c19bc6a97d5ff35387a5 as builder

ARG TARGET_ARCH
ARG EXTRA_PACKAGES

USER root

WORKDIR /build
RUN apk add --no-cache bash git gcc g++ make cmake libc-dev $EXTRA_PACKAGES
RUN git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} --depth=1 /build
RUN if [ -f ./build.bash ]; then bash ./build.bash all; else cd /tmp && cmake /build && make; fi


FROM pizzafactory0contorno/piatto:alpine-latest@sha256:a7c672e88b4fe9d2783f52c10f24608c1fd48b7bd4e0c19bc6a97d5ff35387a5

RUN sudo mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /tmp/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
ENV PATH $PATH:/opt/bin/
