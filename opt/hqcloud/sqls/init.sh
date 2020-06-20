#! /bin/bash
###############################################
##
##          wuheng@otcaixiscas.ac.cn
##              2020-6-20
##
###############################################

#cmd="kubectl get po -n kube-system | grep hqcloud-database | grep Running"
cmd="kubectl get po -n kube-system"
sta=$($cmd | grep hqcloud-database | grep Running)
while [[ -z $sta ]]
do
  sleep 5
  echo "wait for MariaDB Ready"
  sta=$($cmd | grep hqcloud-database | grep Running)
done

mysql -h hqcloud-database.kube-system -uroot -pmultifort < /opt/hqcloud/sqls/dynastie.sql
