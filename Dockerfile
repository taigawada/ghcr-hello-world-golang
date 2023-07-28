FROM arm64v8/golang:1.19-alpine

ENV GOPATH=
WORKDIR /go

COPY ./go.mod /go

RUN go mod tidy

COPY ./main.go /go

RUN go build -o main main.go

CMD GOENV=production /go/main