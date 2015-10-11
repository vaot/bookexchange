docker stop bookexchange
docker rm bookexchange

docker run --name bookexchange \
-e RAILS_ENV=development \
-d \
-P \
-p 80:8080 \
--link bookexchange-db:postgres \
vaot/bookexchange bundle exec puma -p 8080
