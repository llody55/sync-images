# sync-images

镜像同步流水线：dockrehub到阿里云镜像仓库

# 同步镜像版本

```yaml
images:
  llody/udocker:
    - tag: v1.1.1
    - tag: latest
  llody/weixin-robot:
    - tag: v1-amd64
    - tag: v1-arm64
  llody/busybox-tools:
    - tag: v20240507
    - tag: v20240409
    - tag: v20230428
  llody/ssh-agent:
    - tag: v1
  llody/jdk:
    - tag: v11.0.11
  llody/kube-eventer:
    - tag: v1.2.6-amd64-bbf76f7-aliyun
    - tag: v1.2.6-arm64-bbf76f7-aliyun
  llody/docker:
    - tag: 20.10.7-buildx-amd64
  llody/kubectl:
    - tag: v1.15.3
  llody/metrics-server:
    - tag: v0.4.5
    - tag: v0.4.5-slim
    - tag: v0.4.0
  seataio/seata-server:
    - tag: 1.6.1
  clickhouse/clickhouse-server:
    - tag: 24.4.2.141
    - tag: 23.8.14.6
    - tag: 22.8.16.32
  nacos/nacos-server:
    - tag: v2.3.2-slim
    - tag: v2.2.0-slim
    - tag: v2.1.2-slim
  mysql/mysql-server:
    - tag: latest
    - tag: 8.0.32-1.2.11-server
    - tag: 8.0.32
    - tag: 8.0
    - tag: 8.0.30-1.2.9-server
    - tag: 8.0.30
    - tag: 8.0.27-1.2.6-server
    - tag: 8.0.27
    - tag: 8.0.26
    - tag: 5.7.41-1.2.11-server
    - tag: 5.7.41
    - tag: 5.7
  redis:
    - tag: latest
    - tag: 7.0.14
    - tag: 7.0
    - tag: 6.2.7
    - tag: 6.2
    - tag: 6.0
    - tag: 5.0
  mongo:
    - tag: latest
    - tag: 6.0.5
    - tag: 6.0
    - tag: 5.0
  rabbitmq:
   - tag: latest
   - tag: 3.13.3-management
   - tag: 3.13.3
   - tag: 3.12.14-management
   - tag: 3.12.14
   - tag: 3.11.14-management
   - tag: 3.11.14
   - tag: 3.10.14-management
   - tag: 3.10.14
   - tag: 3.9.14-management
   - tag: 3.9.14
   - tag: 3.8.26-management
   - tag: 3.8.26
  elasticsearch:
    - tag: 8.4.3
    - tag: 8.4.2
    - tag: 8.4.1
    - tag: 8.4
    - tag: 8.3.3
    - tag: 8.3.2
    - tag: 8.3.1
    - tag: 8.3
    - tag: 8.2.3
    - tag: 8.2.2
    - tag: 8.2.1
    - tag: 8.2
    - tag: 8.1.3
    - tag: 8.1.2
    - tag: 8.1.1
    - tag: 8.1
    - tag: 8.0.2
    - tag: 8.0.1
    - tag: 8.0
    - tag: 7.17.21
    - tag: 7.17.19
    - tag: 7.17.17
    - tag: 7.17.4
  kibana:
    - tag: 8.4.3
    - tag: 8.4.2
    - tag: 8.4.1
    - tag: 8.4
    - tag: 8.3.3
    - tag: 8.3.2
    - tag: 8.3.1
    - tag: 8.3
    - tag: 8.2.3
    - tag: 8.2.2
    - tag: 8.2.1
    - tag: 8.2
    - tag: 8.1.3
    - tag: 8.1.2
    - tag: 8.1.1
    - tag: 8.1
    - tag: 8.0.2
    - tag: 8.0.1
    - tag: 8.0
    - tag: 7.17.21
    - tag: 7.17.19
    - tag: 7.17.17
    - tag: 7.17.4
  logstash:
    - tag: 8.4.3
    - tag: 8.4.2
    - tag: 8.4.1
    - tag: 8.4
    - tag: 8.3.3
    - tag: 8.3.2
    - tag: 8.3.1
    - tag: 8.3
    - tag: 8.2.3
    - tag: 8.2.2
    - tag: 8.2.1
    - tag: 8.2
    - tag: 8.1.3
    - tag: 8.1.2
    - tag: 8.1.1
    - tag: 8.1
    - tag: 8.0.2
    - tag: 8.0.1
    - tag: 8.0
    - tag: 7.17.21
    - tag: 7.17.19
    - tag: 7.17.17
    - tag: 7.17.4
  fluentd:
    - tag: 2.1.1
    - tag: 2.1.0
    - tag: 2.0.1
    - tag: 2.0.0
  fluent-bit:
    - tag: 1.9.1
    - tag: 1.9.0
    - tag: 1.8.12
    - tag: 1.8.11
    - tag: 1.8.10
    - tag: 1.8.9
    - tag: 1.8.8
    - tag: 1.8.7
    - tag: 1.8.6
    - tag: 1.8.5
    - tag: 1.8.4
    - tag: 1.8.3
    - tag: 1.8.2
    - tag: 1.8.1
    - tag: 1.8.0
    - tag: 1.7.10
    - tag: 1.7.9
    - tag: 1.7.8
    - tag: 1.7.7
    - tag: 1.7.6
    - tag: 1.7.5
    - tag: 1.7.4
    - tag: 1.7.3
    - tag: 1.7.2
    - tag: 1.7.1
    - tag: 1.7.0
    - tag: 1.6.12
    - tag: 1.6.11
  

```
