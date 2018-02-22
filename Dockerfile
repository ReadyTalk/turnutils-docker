FROM alpine:latest

RUN apk --update add coturn

ENV TARGET=turn.domain.com
ENV ARGS="-T -v -p 443 -u websip -w websip"
ENV TIMEOUT=30

CMD /usr/bin/timeout -t $TIMEOUT /usr/bin/turnutils_uclient $ARGS $TARGET
