FROM ubuntu
FROM rust:1.36.0

LABEL maintainer "Takumi Karibe <takumi.k.5610@gmail.com>"

RUN apt-get -y update
RUN \
    apt-get -y install \
    build-essential less gdb \
    && apt-get clean

WORKDIR /work
COPY . .

RUN rustup component add rustfmt
RUN cargo install grcov
RUN cargo build
