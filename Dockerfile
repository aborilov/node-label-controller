FROM golang:1.13.0-stretch as builder
COPY . /controller
WORKDIR /controller
ENV GO111MODULE=on
RUN CGO_ENABLED=0 GOOS=linux go build -o controller

FROM alpine:latest
WORKDIR /root/
RUN apk add --no-cache tzdata
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /controller .
CMD ["./controller"]
