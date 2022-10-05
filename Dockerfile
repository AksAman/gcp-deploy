FROM golang:1.19 as builder

# Create and change to the app directory.
WORKDIR /app

# ENV
ENV PORT 8080

# Expose ports
EXPOSE 8080

# Retrieve application dependencies.
# This allows the container build to reuse cached dependencies.
COPY go.* ./
RUN go mod download

# Copy local code to the container image.
COPY .  ./

WORKDIR /app/lshelper
RUN go build -mod=readonly -v -o lshelperbin
# RUN ./lshelperbin -dir /app/lshelper
# copy the binary to the main app directory
RUN cp lshelperbin /
# CMD ["/lshelperbin", "-dir", "/"]

WORKDIR /app/cmd/webserver
# Build the binary.
# -mod=readonly switch is used to force failure of the build if the go.mod file needs changes to succeed.
# see https://golang.org/cmd/go/#hdr-Preliminary_module_support for more details.
# RUN GO111MODULE=on CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=readonly -v -o gogcp 
RUN go build -mod=readonly -v -o gogcp 

# Use the Google Distroless image for a minimal container.
FROM gcr.io/distroless/static
# Copy the binary to the production image from the builder stage.
COPY --from=builder /app/cmd/webserver/gogcp /

# Run the web service on container startup.
CMD ["/gogcp"]
