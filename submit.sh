$SPARK_HOME/bin/spark-submit \
  --deploy-mode cluster \
  --master k8s://https://10.96.0.1 \
  --kubernetes-namespace spark \
  --conf spark.executor.instances=5 \
  --conf spark.app.name=spark-pi \
  --conf spark.kubernetes.driver.docker.image=kubespark/spark-driver-py:v2.2.0-kubernetes-0.5.0 \
  --conf spark.kubernetes.executor.docker.image=kubespark/spark-executor-py:v2.2.0-kubernetes-0.5.0 \
  --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
  --jars local:///opt/spark/examples/jars/spark-examples_2.11-2.2.0-k8s-0.5.0.jar \
  local:///opt/spark/examples/src/main/python/pi.py 10