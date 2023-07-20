FROM golang:1.20 as builder

WORKDIR /usr/src/app

COPY . .

CMD [ "go", "run", "hello-world.go" ]

RUN CGO_ENABLED=0 GOOS=linux go build -o hello-world .

FROM scratch

COPY --from=builder /usr/src/app /

CMD [ "/hello-world" ]
