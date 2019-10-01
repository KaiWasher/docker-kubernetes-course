docker build -t kw212/multi-client -f ./client/Dockerfile ./client
docker build -t kw212/multi-server -f ./server/Dockerfile ./server
docker build -t kw212/multi-worker -f ./worker/Dockerfile ./worker
docker push kw212/multi-client
docker push kw212/multi-server
docker push kw212/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=kw212/multi-server