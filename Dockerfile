FROM golang AS builder

WORKDIR /go/src/github.com/vaikas/playground/
ADD . /go/src/github.com/vaikas/playground/

RUN CGO_ENABLED=0 go build ./cmd/hello

FROM gcr.io/distroless/base

EXPOSE 8080
COPY --from=builder /go/src/github.com/vaikas/playground/cmd/hello/ /hello

ENTRYPOINT ["/hello"]