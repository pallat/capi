FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    libmicrohttpd-dev

# Copy source code and Makefile
COPY . /usr/src/app
WORKDIR /usr/src/app

# Get dependencies, build the application
RUN make get-deps
RUN make

# Expose the port the app runs on
EXPOSE 8888

# Run the application
CMD ["./main"]
