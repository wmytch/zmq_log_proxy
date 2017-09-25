#! /bin/sh

# Usage log_proxy frontport backendport

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib/

service()
{
# We use setvbuf to disable buffer cache, so we don't need stdbuf any more
    while [ true ]; do
        ./log_proxy 15560 15561
        sleep 1
    done
}

if [ "$#" == "0" ]; then
        /usr/bin/nohup /bin/sh ./start_log_proxy.sh service > /dev/null 2>/dev/null &
else
        service
fi

