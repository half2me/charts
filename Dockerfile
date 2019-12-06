FROM alpine:latest

RUN apk add --no-cache curl

ENV IP4_URL http://ip4.iurl.no
ENV DO_API_BASE_URL https://api.digitalocean.com/v2

ENV DO_TOKEN ""
ENV DO_DOMAIN ""
ENV DO_RECORD_ID ""

CMD [ "sh", "-c", " \
    rip=`curl \"${IP4_URL}\"` && \
    url=\"${DO_API_BASE_URL}/domains/${DO_DOMAIN}/records/${DO_RECORD_ID}\" && \
    body=\"{\\\"data\\\": \\\"${rip}\\\"}\" && \
    curl -v -X PUT -H \"Content-Type: application/json\" -H \"Authorization: Bearer ${DO_TOKEN}\" -d \"${body}\" \"${url}\" \
"]
