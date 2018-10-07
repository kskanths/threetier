sleep 30
LBNAME=`/usr/local/bin/kubectl describe service frontend|grep Ingress|awk '{print $NF}'`
sed -i "s/FELBNAME/$LBNAME/g" dns.json
aws route53 change-resource-record-sets --hosted-zone-id ZW5WSDMP8LZYK --change-batch file://dns.json
