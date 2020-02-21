docker build -t rainerza/multi-client -f ./client/Dockerfile ./client
docker build -t rainerza/multi-server -f ./server/Dockerfile ./server
docker build -t rainerza/multi-worker -f ./worker/Dockerfile ./worker