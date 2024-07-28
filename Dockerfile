FROM python:3.9-slim-bullseye

ARG ssl_key
ARG ssl_crt
ARG password

WORKDIR /updog
COPY . .

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install -r requirements.txt

RUN echo "$ssl_key" > updog.key && \
    echo "$ssl_crt" > updog.crt && \
    chmod 600 /updog/updog.key && \
    chmod 600 /updog/updog.key

# Run the application:
CMD ["/opt/venv/bin/python", "updog.py", "--ssl", "--password", password]
