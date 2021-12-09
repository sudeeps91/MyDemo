cd /var/lib/jenkins

mkdir -p ${JOB_NAME}/${BUILD_NUMBER}
cd ${JOB_NAME}/${BUILD_NUMBER}

#cloning MyDemo repository
git clone git@github.com:sudeeps91/MyDemo.git


cd MyDemo
docker build . -t helloworld:$BUILD_NUMBER

imageurl="$appname:$BUILD_NUMBER"

docker tag $imageurl ghcr.io/sudeeps91/$imageurl
docker push ghcr.io/sudeeps91/$imageurl
#echo $imageurl

echo "app is $appname"


#creating deployment manifest file for deployment
cp templates/deployment.yml $appname.yml
sed -i s/appname/$appname/g $appname.yml
sed -i s/imagename/$imageurl/g $appname.yml

cat $appname.yml
#creating deployment
kubectl delete -f $appname.yml

sleep 10

kubectl apply -f $appname.yml


#creating service manifest file for deployment
cp templates/nodePortService.yml $appname-svc.yml
sed -i "s/appname/$appname/g" $appname-svc.yml


#creating service

kubectl apply -f $appname-svc.yml

#creating hpa
kubectl autoscale deployment $appname --cpu-percent=50 --min=1 --max=10
