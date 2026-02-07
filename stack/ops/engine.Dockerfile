FROM golang:alpine AS builder

WORKDIR /orglang

COPY . .

RUN go build -o engine engine/app/main.go

FROM alpine

WORKDIR /orglang

COPY engine/app/reference.yaml .

COPY --from=builder /orglang/engine .

ENTRYPOINT ["/orglang/engine"]
