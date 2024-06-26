@echo off
echo deleting all current running resources in kubernetes.
kubectl delete all --all -n kiii-project-borisdz-185022
kubectl delete configmap --all -n kiii-project-borisdz-185022
kubectl delete secret --all -n kiii-project-borisdz-185022
kubectl delete pvc --all -n kiii-project-borisdz-185022
kubectl delete ingress --all -n kiii-project-borisdz-185022
echo running all manifests.
kubectl apply -f namespace.yml
kubectl apply -f secret-postgresql.yml
kubectl apply -f configmap-app.yml
kubectl apply -f postgres-pv.yml
kubectl apply -f postgres-pvc.yml
kubectl apply -f deployment-postgres.yml
kubectl apply -f service-postgresql.yml
kubectl apply -f deployment-app.yml
kubectl apply -f service-app.yml
kubectl apply -f ingress.yml
pause
