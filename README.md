Gaming on i2p with Freeciv and Docker
=====================================

It may surprise you, but it's actually possible to play games across anonymous
networks under the right circumstances. While it's not especially likely that
you'll be able to play real-time, demanding games while also having a high
degree of anonymity anytime soon, it's entirely possible to play turn-oriented
games, or to turn down the anonymity(and use i2p as a peer-to-peer network) and
take advantage of the higher speed. This guide builds incrementally on the
previous two guides by doing slightly more advanced configuration of i2pd's
server tunnel, and adding in a client tunnel with a fixed destination.

In this tutorial:
-----------------

  * We use single-hop tunnels. This is a bit like a VPN, but where you would use a random VPN server every time. *The intermediate node will know your IP address, but not what you are transmitting. The endpoints will not be able to discern eachother's IP addresses. If you desire greater anonymity, Freeciv can be played successfully with as many as 3 hops for both clients and servers*, but is sometimes less reliable.

Freeciv over i2p: The Server
----------------------------

### Prerequisites

Like the previous tutorials, this tutorial requres a docker network for
configuring the hosts and i2pd running in a docker container. For convenience's
sake, we can use the existing container and network on 172.81.81.0, or we can
create new ones. Hopefully by now this process is familiar, and readers have
realized that configuring services to run across eepSites is very similar across
the board.

Freeciv over i2p: The Client
----------------------------

### Prerequisites

Similar to the previous tutorials, except in this case it is intended to be run
on a computer other than the computer running the server. You still need an i2p
router running on the client computer.
