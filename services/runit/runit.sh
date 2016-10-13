#!/bin/bash
set -e
set -x

RUNITVERSION="2.1.2"
RUNITGZIP="runit-${RUNITVERSION}.tar.gz"
RUNITTAR="runit-${RUNITVERSION}.tar"

apk add --no-cache fortify-headers

mkdir -p /package
chmod 1755 /package

wget http://smarden.org/runit/${RUNITGZIP}
gunzip ${RUNITGZIP}
tar -xpf ${RUNITTAR}
rm ${RUNITTAR}
cd admin/runit-${RUNITVERSION}
package/install
