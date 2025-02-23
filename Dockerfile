FROM alpine:latest

RUN apk add --no-cache netcat-openbsd iputils net-tools

COPY nc_server.sh /nc_server.sh
RUN chmod +x /nc_server.sh

COPY nc_client.sh /nc_client.sh
RUN chmod +x /nc_client.sh

CMD ["/bin/sh"]