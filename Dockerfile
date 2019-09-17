FROM alpine as builder

ARG TARGET_ARCH

RUN apk add --no-cache git gcc make libc-dev


RUN git clone https://github.com/tmori/athrill.git
RUN git clone https://github.com/tmori/athrill-target.git
WORKDIR athrill-target/v850e2m/build_linux/
RUN make

FROM alpine
RUN mkdir -p /opt/bin/ /opt/src/athrill /opt/src/athrill-target/
COPY --from=builder /athrill/bin/linux/athrill2 /opt/bin/
COPY --from=builder /athrill/trunk/ /opt/src/athrill/
COPY --from=builder /athrill-target/${TARGET_ARCH} /opt/src/athrill-target/

VOLUME /projects

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
