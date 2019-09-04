FROM ortussolutions/commandbox:4.6.0

COPY ./app ${APP_DIR}/

RUN ${BUILD_DIR}/util/warmup-server.sh