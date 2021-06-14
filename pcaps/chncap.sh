#!/bin/sh
# https://www.xmodulo.com/how-to-capture-and-replay-network-traffic-on-linux.html
#
INFILE=original.pcap
OUTFILE=FH4Test.pcap
# Source data
OSIP=192.168.13.104
NSIP=192.168.13.118
#OSMAC=c4:d9:87:44:59:99
NSMAC=c4:d9:87:44:59:99

# Destination data
ODIP=192.168.13.118
NDIP=192.168.13.103
#ODMAC=48:5F:99:02:93:F1
NDMAC=48:5F:99:02:93:F1

# Rewrite sources
# echo Rewrite destionation: tcprewrite --infile $INFILE --outfile $OUTFILE --dstipmap=$ODIP:$NDIP --enet-dmac=$NDMAC --fixcsum

# Rewrite sources
# echo tcprewrite --infile=temp1.pcap --outfile=temp2.pcap --srcipmap=$OSIP:$NSIP --enet-smac=$NSMAC

# Fix checksums
# echo tcprewrite --infile=temp2.pcap --outfile=$OUTFILE --fixcsum

# But for now all at once!
echo tcprewrite --infile $INFILE --outfile $OUTFILE --dstipmap=$ODIP:$NDIP --enet-dmac=$NDMAC --srcipmap=$OSIP:$NSIP --enet-smac=$NSMAC --fixcsum
tcprewrite --infile $INFILE --outfile $OUTFILE --dstipmap=$ODIP:$NDIP --enet-dmac=$NDMAC --srcipmap=$OSIP:$NSIP --enet-smac=$NSMAC --fixcsum
