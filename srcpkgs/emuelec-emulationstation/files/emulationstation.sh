#!/bin/sh

while true; do
    rm -f /tmp/es-restart
    cd /opt/emulationstation
    ./emulationstation "$@"
    ret=$?
    [ -f /tmp/es-restart ] && continue
    break
done
exit $ret
