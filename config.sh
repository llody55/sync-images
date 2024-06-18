echo "镜像版本查询中，请稍等。。。。。" 
echo "docker.io:" >> images.yaml
echo "  images:" >> images.yaml
echo "    calico/cni:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://docker.io/calico/cni | grep '"v' | awk '/v3/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|version|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v3" && ($2 > 10 || ($2 == 10 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "    calico/node:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://docker.io/calico/node | grep '"v' | awk '/v3/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|version|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v3" && ($2 > 10 || ($2 == 10 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "    calico/pod2daemon-flexvol:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://docker.io/calico/pod2daemon-flexvol | grep '"v' | awk '/v3/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|version|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v3" && ($2 > 10 || ($2 == 10 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "    calico/kube-controllers:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://docker.io/calico/kube-controllers | grep '"v' | awk '/v3/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|version|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v3" && ($2 > 10 || ($2 == 10 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "registry.k8s.io:" >> images.yaml
echo "  images:" >> images.yaml
echo "    etcd:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/etcd | grep -v v| grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    pause:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/pause | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' | grep -E '^[[:space:]]*-[[:space:]]*[0-9]+(\.[0-9]+)*$' >> images.yaml
echo "    kube-proxy:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/kube-proxy | grep '"v' | awk '/v1/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v1" && ($2 > 16 || ($2 == 16 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "    kube-apiserver:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/kube-apiserver | grep '"v' | awk '/v1/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v1" && ($2 > 16 || ($2 == 16 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "    kube-scheduler:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/kube-scheduler | grep '"v' | awk '/v1/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v1" && ($2 > 16 || ($2 == 16 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "    kube-controller-manager:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/kube-controller-manager | grep '"v' | awk '/v1/ {flag=1} flag' | grep -v -E 'alpha|beta|rc|amd64|ppc64le|arm64|arm|s390x|SNAPSHOT|debug|master|main|\}|\]|\{|Repository|Tags|dev|g|-' | awk -F '"' '{print $2}' | sort -V | awk -F. '$1 == "v1" && ($2 > 16 || ($2 == 16 && $3 > 0)) {print "    - " $0}' >> images.yaml
echo "    coredns/coredns:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/coredns/coredns | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    dns/k8s-dns-node-cache:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/dns/k8s-dns-node-cache | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    metrics-server/metrics-server:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/metrics-server/metrics-server | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    ingress-nginx/controller:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/ingress-nginx/controller | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    ingress-nginx/kube-webhook-certgen:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/ingress-nginx/kube-webhook-certgen | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    kube-state-metrics/kube-state-metrics:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/kube-state-metrics/kube-state-metrics | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    prometheus-adapter/prometheus-adapter:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/prometheus-adapter/prometheus-adapter | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    sig-storage/nfs-subdir-external-provisioner:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/sig-storage/nfs-subdir-external-provisioner | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    sig-storage/csi-node-driver-registrar:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/sig-storage/csi-node-driver-registrar | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    sig-storage/csi-provisioner:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/sig-storage/csi-provisioner | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    sig-storage/csi-resizer:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/sig-storage/csi-resizer | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    sig-storage/csi-snapshotter:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/sig-storage/csi-snapshotter | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    sig-storage/csi-attacher:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/sig-storage/csi-attacher | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    sig-storage/nfsplugin:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/sig-storage/nfsplugin | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml
echo "    defaultbackend-amd64:" >> images.yaml
skopeo list-tags --tls-verify=false  docker://registry.k8s.io/defaultbackend-amd64 | grep -v alpha | grep -v beta | grep -v rc | grep -v amd64 | grep -v ppc64le | grep -v arm64 | grep -v arm | grep -v s390x | grep -v SNAPSHOT | grep -v debug | grep -v master | grep -v main | grep -v \} | grep -v \] | grep -v \{ | grep -v Repository | grep -v Tags | grep -v dev | grep -v g | grep -v '-'| awk -F '"' '{print "    - "$2}' >> images.yaml