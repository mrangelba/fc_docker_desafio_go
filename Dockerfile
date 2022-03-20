FROM golang:alpine AS builder

WORKDIR /src
COPY ./main.go .
RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /
COPY --from=builder /src / 
ENTRYPOINT ["./main"]