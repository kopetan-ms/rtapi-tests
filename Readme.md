## Quick and dirty rtapi image with tests

### Build the image
``` bash
version=v1
acrname=dotnetcorecontainersacr
az acr build -t apim-test/rtapi:$version -r $acrname .
```

### Execute into the pod
```
version=v1
acrname=dotnetcorecontainersacr
kubectl run rtapi --image=$acrname.azurecr.io/apim-test/rtapi:$version
kubectl exec -it rtapi -- bash
```

### Run the tests

```
./tools/rtapi --file endpoint-full.yaml --print
./tools/rtapi --file endpoint-internal-dns.yaml --print
./tools/rtapi --file endpoint-internal-podip.yaml --print
./tools/rtapi --file endpoint-internal-apim.yaml --print
```