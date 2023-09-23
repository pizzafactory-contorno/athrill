FROM pizzafactory0contorno/piatto:alpine-3.15.0@sha256:86b99c320ae0b88e0b7f62d6c3cde94d13500c329a3a54209373bd4613d0f675 as builder

ARG TARGET_ARCH
ARG EXTRA_PACKAGES_HAKO_DEV

USER root

WORKDIR /build
RUN apk add --no-cache bash git gcc g++ make cmake libc-dev $EXTRA_PACKAGES_HAKO_DEV
RUN git clone --recursive https://github.com/toppers/athrill-target-${TARGET_ARCH} --depth=1 /build
RUN if [ -f ./build.bash ]; then bash ./build.bash all; else cd /tmp && cmake /build && make; fi


FROM pizzafactory0contorno/piatto:alpine-3.15.0@sha256:86b99c320ae0b88e0b7f62d6c3cde94d13500c329a3a54209373bd4613d0f675

ARG EXTRA_PACKAGES_HAKO
RUN sudo apk add --no-cache $EXTRA_PACKAGES_HAKO \
 && sudo mkdir -p /opt/bin/ /opt/src/athrill
COPY --from=builder /tmp/athrill2 /opt/bin/athrill2
COPY --from=builder /build/ /opt/src/athrill/
ENV PATH $PATH:/opt/bin/
