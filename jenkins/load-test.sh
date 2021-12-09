cd /var/lib/jenkins

mkdir -p ${JOB_NAME}/${BUILD_NUMBER}
cd ${JOB_NAME}/${BUILD_NUMBER}

#cloning MyDemo repository
git clone git@github.com:sudeeps91/MyDemo.git


cd MyDemo/manifests

#creating load-tester
kubectl apply -f load.yml
