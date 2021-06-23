# offline-helper

本项目主要用于rpm打包，目前仅支持CentOS

```
yum install rpm-build gcc gcc-c++
```
然后新建两个目录

```
mkdir -p /root/rpmbuild/SOURCES/
mkdir -p /root/rpmbuild/SPECS/
```

## prod-images.spec	

拷贝prod-images.spec文件

```
cp prod-images.spec	/root/rpmbuild/SPECS/
```

进入registry目录

```
cd /var/lib/registry/
```

新建文件夹prod-images-1.0.0，这个与prod-images.spec中名字和版本描述一致，可自行修改

```
mkdir prod-images-1.0.0
```

打包文件，建设你当前在目录/var/lib/registry/下，

```
cp -r docker prod-images-1.0.0/
tar zcvf prod-images-1.0.0.tar.gz prod-images-1.0.0/*
cp prod-images-1.0.0.tar.gz /root/rpmbuild/SOURCES/
```

执行打包命令，如果报依赖错误，请yum自行安装并重试

```
rpmbuild -ba /root/rpmbuild/SPECS/prod-images.spec
```

## prod-dynastie.spec

拷贝prod-dynastie.spec文件

```
cp prod-dynastie	/root/rpmbuild/SPECS/
```


新建文件夹prod-dynastie-1.0.0，这个与prod-dynastie.spec中名字和版本描述一致，可自行修改

```
mkdir prod-dynastie-1.0.0
```

本项目根目录下有sqls, yamls和configs三个文件夹

```
cp -r sqls prod-dynastie-1.0.0/
cp -r yamls prod-dynastie-1.0.0/
cp -r configs prod-dynastie-1.0.0/
tar zcvf prod-dynastie-1.0.0.tar.gz prod-dynastie-1.0.0/*
cp prod-dynastie-1.0.0.tar.gz /root/rpmbuild/SOURCES/
```

执行打包命令，如果报依赖错误，请yum自行安装并重试

```
rpmbuild -ba /root/rpmbuild/SPECS/prod-dynastie.spec
```

## Yaml说明

本项目假设是在root用户下安装，如果不是，需要修改

- 基础组件
  - hqcloud-database.yaml:
    - 主要功能：安装mariadb和可视化软件adminer
    - 端口映射：3306->32306, 8080->32080
    - 域名服务：hqcloud-database.kube-system
  - hqcloud-init-sql.yaml:
    - 主要功能：初始化sql
    - 挂载位置：/opt/hqcloud/sqls, /usr/bin/kubectl, /usr/lib64
  - hqcloud-keycloak.yaml:
    - 主要功能：权限中心
    - 端口映射：8080->31080
    
- 中间件模板
  - hqcloud-etcd.yaml:
    - 主要功能：中间件数据载体
    - 端口映射：2379->32379
    - 挂载位置：/opt/hqcloud/lib/etcd
    - 域名服务：hqcloud-etcd.kube-system
  - hqcloud-kafka-template.yaml:
    - 挂载位置：/root/.kube/config, /usr/etcd/etcdctl
  - hqcloud-postgresql-template.yaml:
    - 挂载位置：/root/.kube/config, /usr/etcd/etcdctl
  - hqcloud-rabbitmq-template.yaml:
    - 挂载位置：/root/.kube/config, /usr/etcd/etcdctl
  - hqcloud-redis-template.yaml:
    - 挂载位置：/root/.kube/config, /usr/etcd/etcdctl
  - hqcloud-tensorflow-template.yaml:
    - 挂载位置：/root/.kube/config, /usr/etcd/etcdctl
  - hqcloud-xugu-server-template.yaml:
    - 挂载位置：/root/.kube/config, /usr/etcd/etcdctl

- 核心服务
  - hqcloud-iams.yaml:
    - 端口映射：8080->32051
    - 域名服务：hqcloud-iams.kube-system
  - hqcloud-osms.yaml:
    - 端口映射：8080->32052
    - 域名服务：hqcloud-osms.kube-system
