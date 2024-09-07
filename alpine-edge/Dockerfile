FROM pizzafactory0contorno/piatto:alpine-edge@sha256:50ade7610e84d3699b2a6df9f5ba7fd545407ee009d798e353937c237f31ab0d as builder

ARG TARGET_ARCH
ARG EXTRA_PACKAGES

USER root

WORKDIR /build
RUN apk add --no-cache bash git gcc g++ make cmake libc-dev $EXTRA_PACKAGES
RUN git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} --depth=1 /build
RUN if [ -f ./build.bash ]; then bash ./build.bash all; else cd /tmp && cmake /build && make; fi


FROM pizzafactory0contorno/piatto:alpine-edge@sha256:50ade7610e84d3699b2a6df9f5ba7fd545407ee009d798e353937c237f31ab0d

RUN sudo mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /tmp/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
ENV PATH $PATH:/opt/bin/
