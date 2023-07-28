FROM --platform=$BUILDPLATFORM golang:1.19.7-alpine AS builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "Now,running on $BUILDPLATFORM, building for $TARGETPLATFORM"

ENV GOPATH=
WORKDIR /

COPY ./go.mod .

RUN go mod tidy

COPY ./main.go .

RUN go build -o main main.go

FROM alpine:latest
WORKDIR /

COPY --from=builder /main .

CMD ["./main"]