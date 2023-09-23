FROM pizzafactory0contorno/piatto:alpine-3.10@sha256:22a6dcaee2d76aa709064528db91cbedfd9197294917089e07433fcfec97bd6d as builder

ARG TARGET_ARCH
ARG EXTRA_PACKAGES_HAKO_DEV

USER root

WORKDIR /build
RUN apk add --no-cache bash git gcc g++ make cmake libc-dev $EXTRA_PACKAGES_HAKO_DEV
RUN git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} --depth=1 /build
RUN if [ -f ./build.bash ]; then bash ./build.bash all; else cd /tmp && cmake /build && make; fi


FROM pizzafactory0contorno/piatto:alpine-3.10@sha256:22a6dcaee2d76aa709064528db91cbedfd9197294917089e07433fcfec97bd6d

ARG EXTRA_PACKAGES_HAKO
RUN sudo apk add --no-cache $EXTRA_PACKAGES_HAKO \
 && sudo mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /tmp/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
ENV PATH $PATH:/opt/bin/
