FROM alpine:latest

RUN apk add --no-cache wget tar

WORKDIR /app

# 下载 sing-box
RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.13.13/sing-box-1.13.13-linux-arm64.tar.gz && \
    tar -zxvf sing-box-1.13.13-linux-arm64.tar.gz && \
    mv sing-box-1.13.13-linux-arm64/sing-box /usr/local/bin/sing-box && \
    rm -rf sing-box-1.13.13-linux-arm64* sing-box-1.13.13-linux-arm64.tar.gz

COPY config.json /app/config.json

EXPOSE 8080

CMD ["sing-box", "run", "-c", "config.json"]
