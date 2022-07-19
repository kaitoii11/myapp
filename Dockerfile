# syntax=docker/dockerfile:1

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY myapp /myapp

EXPOSE 8080 9360

USER myapp:myapp

ENTRYPOINT ["/myapp"]
