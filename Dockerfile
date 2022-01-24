FROM golang:1.14-alpine as build
WORKDIR /code
#COPY go.mod .
#RUN go mod download
COPY . .
RUN [ "go","build","/code/server.go"]

FROM alpine:3.15.0 as runner
WORKDIR /code
COPY --from=build /code/server /code/server 
EXPOSE 8000
CMD [ "sh","-c","/code/server" ]