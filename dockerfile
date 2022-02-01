from golang:latest as compiling_stage
run mkdir -p /go/src/pipeline
workdir /go/src/pipeline
add main.go .
add go.mod .
run go install .

from alpine:latest
label version="1.0.0"
label maintainer="Istomin German<needwolf@gmail.com>"
workdir /root/
copy --from=compiling_stage /go/bin/pipeline .
entrypoint ./pipeline
