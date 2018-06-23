FROM debian:sid
RUN apt-get update
RUN apt-get install -y freeciv-server
RUN adduser --disabled-password --gecos ',,,,' freeciv
RUN ls /usr/share/games/freeciv/
RUN echo set nettimeout=120 >> /usr/share/games/freeciv/civ2civ3.serv
RUN echo set netwait=20 >> /usr/share/games/freeciv/civ2civ3.serv
RUN echo set pingtime=60 >> /usr/share/games/freeciv/civ2civ3.serv
RUN echo set pingtimeout=600 >> /usr/share/games/freeciv/civ2civ3.serv
USER freeciv
CMD /usr/games/freeciv-server \
    --bind 0.0.0.0 \
    --port 5555 \
    --identity "i2p-freeciv" \
    -r /usr/share/games/freeciv/civ2civ3.serv \
    --exit-on-end
