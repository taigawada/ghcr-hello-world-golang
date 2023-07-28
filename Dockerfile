FROM golang:1.19.7-alpine AS builder

ENV GOPATH=
WORKDIR /

COPY ./go.mod .

RUN go mod tidy

COPY ./main.go .

RUN go build -o main main.go

FROM arm64v8/alpine:latest
WORKDIR /

COPY --from=builder /main .

CMD ["./main"]