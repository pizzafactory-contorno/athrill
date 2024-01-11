FROM pizzafactory0contorno/piatto:alpine-3.15.0@sha256:bbded2a4e5bb0650b175e410b04f715f11a851b0f2ca2e1451b6150d278fe865 as builder

ARG TARGET_ARCH
ARG EXTRA_PACKAGES

USER root

WORKDIR /build
RUN apk add --no-cache bash git gcc g++ make cmake libc-dev $EXTRA_PACKAGES
RUN git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} --depth=1 /build
RUN if [ -f ./build.bash ]; then bash ./build.bash all; else cd /tmp && cmake /build && make; fi


FROM pizzafactory0contorno/piatto:alpine-3.15.0@sha256:bbded2a4e5bb0650b175e410b04f715f11a851b0f2ca2e1451b6150d278fe865

RUN sudo mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /tmp/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
ENV PATH $PATH:/opt/bin/
