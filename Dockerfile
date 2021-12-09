ARG BASE_IMAGE
FROM ${BASE_IMAGE} as builder

ARG TARGET_ARCH

USER root

WORKDIR /build
RUN apk add --no-cache git gcc make libc-dev \
 && git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} /build \
 && make -C build_linux

FROM ${BASE_IMAGE}

ARG TARGET_ARCH

USER root

RUN mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /build/build_linux/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
USER user
ENV PATH $PATH:/opt/bin/
