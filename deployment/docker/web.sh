docker stop bookexchange
docker rm bookexchange
docker run --name bookexchange -d \
       -e RAILS_ENV=production \
       -p 5005:80 \
       victorvaot/bookexchange /usr/bin/start-server.sh
