
FROM alpine

RUN apk add --no-cache php7

COPY compare-ini-files /mnt

WORKDIR /mnt

ENTRYPOINT ["./compare-ini-files"]


