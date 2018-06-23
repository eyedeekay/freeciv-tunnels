
build: build-i2pd build-freeciv

run: i2pd freeciv

build-i2pd:
	docker build --rm -f Dockerfile.i2pd -t eyedeekay/freeciv-i2pd .

run-i2pd: network
	docker run --restart=always -i -d -t \
		--name freeciv-i2pd \
		--network eepsite \
		--network-alias freeciv-i2pd \
		--hostname freeciv-i2pd \
		--ip 172.81.81.2 \
		-p :4567 \
		-p 127.0.0.1:7070:7070 \
		-p 127.0.0.1:5555:5555 \
		-v eepsite:/var/lib/i2pd \
		eyedeekay/freeciv-i2pd; true

i2pd: build-i2pd run-i2pd

build-freeciv:
	docker build --rm \
		-f Dockerfile -t eyedeekay/i2p-freeciv .

build-client:
	docker build --rm \
		-f Dockerfile.client -t eyedeekay/i2p-freeciv-client .

run-freeciv: network
	docker run --restart=always -i -t -d \
		--name i2p-freeciv \
		--network eepsite \
		--network-alias i2p-freeciv \
		--hostname i2p-freeciv \
		--ip 172.81.81.3 \
		eyedeekay/i2p-freeciv

freeciv: build-freeciv run-freeciv

network:
	docker network create --subnet 172.81.81.0/29 eepsite; true

site:
	markdown README.md > website/index.html

run-client:
	docker run -i -t --rm \
		-e DISPLAY=:0 \
		--name i2p-freeciv-client \
		--network eepsite \
		--network-alias i2p-freeciv-client \
		--hostname i2p-freeciv-client \
		--ip 172.81.81.4 \
		--link freeciv-i2pd \
		--volume freeciv-client:/home/freeciv \
		--volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
		eyedeekay/i2p-freeciv-client

clean:
	docker rm -f i2p-freeciv freeciv-i2pd; true
