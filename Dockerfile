FROM ubuntu AS base
COPY . .

ENTRYPOINT while :; do read; done