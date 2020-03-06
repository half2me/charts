# do-duc
Digital Ocean Dynamic DNS Update Client

## Install with helm
```bash
helm repo add half2me https://half2me.github.io/charts
helm repo update

# Install any of the apps, for example DO-DUC with:
helm install duc --set do.domain=yourdomain,do.token=yourtoken,do.recordId=yourrecordid --namespace duc half2me/do-duc
```
