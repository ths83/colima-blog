FROM alpine:3.17

WORKDIR test/

COPY scripts/ scripts
COPY test.sh .

ENTRYPOINT ["sh"]
