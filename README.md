# do-duc
Digital Ocean Dynamic DNS Update Client

## Install with helm
```bash
helm repo add duc https://half2me.github.io/do-duc
help repo update
helm install duc --set do.domain=yourdomain,do.token=yourtoken,do.recordId=yourrecordid --namespace duc duc/do-duc
```
