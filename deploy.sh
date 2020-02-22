docker build -t rainerza/multi-client:$SHA -t rainerza/multi-client:latest -f ./client/Dockerfile ./client
docker build -t rainerza/multi-server:$SHA -t rainerza/multi-server:latest -f ./server/Dockerfile ./server
docker build -t rainerza/multi-worker:$SHA -t rainerza/multi-worker:latest -f ./worker/Dockerfile ./worker

docker push rainerza/multi-client:$SHA
docker push rainerza/multi-server:$SHA
docker push rainerza/multi-worker:$SHA 

docker push rainerza/multi-client:latest
docker push rainerza/multi-server:latest
docker push rainerza/multi-worker:latest

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rainerza/multi-server:$SHA
kubectl set image deployments/client-deployment client=rainerza/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=rainerza/multi-worker:$SHA