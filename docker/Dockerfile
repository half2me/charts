FROM alpine:latest

RUN apk add --no-cache curl jq
ADD duc.sh .

ENV IP4_URL http://ip4.iurl.no
ENV DO_API_BASE_URL https://api.digitalocean.com/v2

ENV DO_TOKEN ""
ENV DO_DOMAIN ""
ENV DO_RECORD_ID ""

CMD ["duc.sh", "update"]
