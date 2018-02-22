FROM alpine:latest

RUN apk --update add coturn

CMD /usr/bin/turnutils_uclient -T  -v  -p 443 -u websip -w websip  ${TARGET}
