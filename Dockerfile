FROM golang:1.21.7-alpine3.19 AS builder

WORKDIR /usr/src/app


COPY fullcycle.go .
COPY go.mod .
# CMD ["go", "run", "."]
# RUN go run .
RUN go build -v -o /usr/src/app/fullcycle ./...

FROM scratch
# WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/fullcycle fullcycle

CMD ["./fullcycle"]