FROM python:alpine
COPY . /opt/app
WORKDIR /opt/app
ENV PROFILE default
RUN apk --no-cache --virtual build add sed build-base libffi-dev openssl-dev jpeg-dev zlib-dev libwebp-dev git&&\
    apk --no-cache add libmagic ffmpeg cairo libopus  &&\
    pip install -U pip &&\
    pip install -r requirements.txt &&\
    rm -rf ~/.cache &&\
    apk del build  &&\
    chmod +x /opt/app/init.sh
CMD ["/opt/app/init.sh"]
