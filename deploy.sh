docker build -t kw212/multi-client:latest -t kw212/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kw212/multi-server:latest -t kw212/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kw212/multi-worker:latest -t kw212/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push kw212/multi-client:latest
docker push kw212/multi-server:latest
docker push kw212/multi-worker:latest

docker push kw212/multi-client:$SHA
docker push kw212/multi-server:$SHA
docker push kw212/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=kw212/multi-server:$SHA
kubectl set image deployments/client-deployment client=kw212/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=kw212/multi-worker:$SHA