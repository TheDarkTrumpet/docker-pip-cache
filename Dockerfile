FROM alpine:latest

RUN apk add --update --no-cache bash ca-certificates python3 supervisor \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache-dir --upgrade pip setuptools \
    && update-ca-certificates

RUN apk add --no-cache --virtual .build-deps gcc python3-dev libffi-dev musl-dev \
    && pip install --no-cache-dir \
        devpi-server \
        devpi-web \
        devpi-client \
        devpi-cleaner \
    devpi-semantic-ui \
    && apk del .build-deps

# packaging still gets deleted, a quick fix is to re pip install everything
# from above.
RUN pip install --no-cache-dir devpi-server devpi-web devpi-client \
    devpi-cleaner devpi-semantic-ui

ENV DEVPI_THEME=semantic-ui

EXPOSE 3141
COPY entrypoint.sh /
VOLUME /data
ENV HOME /data
WORKDIR /data
ENTRYPOINT ["/entrypoint.sh"]
