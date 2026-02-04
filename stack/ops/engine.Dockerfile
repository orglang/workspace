FROM golang:alpine AS builder

WORKDIR /orglang

COPY . .

RUN go build -o engine go-runtime/app/main.go

FROM alpine

WORKDIR /orglang

COPY go-runtime/app/reference.yaml .

COPY --from=builder /orglang/engine .

ENTRYPOINT ["/orglang/engine"]
