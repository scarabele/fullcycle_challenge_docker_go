FROM golang:1.18-alpine AS builder
WORKDIR /usr/src/app
COPY ./helloworld.go .
RUN go build helloworld.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
CMD [ "./helloworld" ]