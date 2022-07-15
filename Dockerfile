# syntax=docker/dockerfile:1

## BUILD

FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /app/myapp

## DEPLOY

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /app/myapp /myapp

EXPOSE 8080 9360

USER myapp:myapp

ENTRYPOINT ["/myapp"]
