FROM golang:alpine AS builder

WORKDIR /orglang

COPY . .

RUN go build -o engine go-engine/app/main.go

FROM alpine

WORKDIR /orglang

COPY go-engine/app/reference.yaml .

COPY --from=builder /orglang/engine .

ENTRYPOINT ["/orglang/engine"]
