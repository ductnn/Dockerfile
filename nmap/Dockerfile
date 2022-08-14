FROM ubuntu:20.04
LABEL author="ductnn"

RUN apt update \
    && apt install nmap net-tools -y \
    && rm -rf /var/lib/apt/lists/*

COPY ipscan.sh /ipscan.sh
