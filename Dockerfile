FROM debian:sid
ARG file=civ2civ3.serv
ENV file=$file
RUN apt-get update
RUN apt-get install -y freeciv-server
RUN adduser --disabled-password --gecos ',,,,' freeciv
WORKDIR /usr/share/games/freeciv/
COPY $file /usr/share/games/freeciv/$file
WORKDIR /home/freeciv
USER freeciv
CMD /usr/games/freeciv-server \
    --bind 0.0.0.0 \
    --port 5555 \
    --identity "i2p-freeciv" \
    -r /usr/share/games/freeciv/$file \
    --exit-on-end
