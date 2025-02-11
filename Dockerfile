FROM golang:1.17-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /lesson-086

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /lesson-086 /lesson-086

USER nonroot:nonroot

ENTRYPOINT ["/lesson-086"]
