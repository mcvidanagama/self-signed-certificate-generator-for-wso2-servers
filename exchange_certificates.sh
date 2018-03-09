#!/bin/bash

#===========================================================
#======================Set values here======================
#===========================================================
STORE_PASS="wso2carbon" #keystore/client truststore  password
VALIDITY="3650"		#validity period(in days) for the generated key. eg: 3650 = 10 years
OU="Services" 		#Organization Unit
O= "My Company" 	#Name of the Organization
L="Colombo" 		#Locality or City
S="Western" 		#State or Province
C="LK" 			#Two letter country code
#============================================================
#============================================================
#============================================================


echo "\n\nReading sub directories to extract domain names...."
DOMAIN_ARRAY=()
#read the subfolder names and add to an array
for d in ./*; do
  if [ -d "$d" ]; then
 	DOMAIN=`echo $d | sed 's/\.\///g'`
	DOMAIN_ARRAY+=($DOMAIN)
  fi
done


echo ${DOMAIN_ARRAY[@]}
for domain in "${DOMAIN_ARRAY[@]}"
do
  echo "${var}"
  keytool -genkey -alias $domain -keyalg RSA -keysize 2048 -validity $VALIDITY -keystore $domain/wso2carbon.jks -dname "CN=$domain,OU=$OU,O=$O,L=$L,S=$S,C=$C" -storepass $STORE_PASS -keypass $STORE_PASS -noprompt
  echo "Exporting public certificate of $domain"
  keytool -export -alias $domain -file $domain/pubkey.crt -keystore $domain/wso2carbon.jks -storepass $STORE_PASS -noprompt
  for trustoredomain in "${DOMAIN_ARRAY[@]}"
  do
    echo "Importing $domain public cert to $trustoredomain client truststore"
    keytool -import -trustcacerts -alias $domain -file $domain/pubkey.crt -keystore $trustoredomain/client-truststore.jks -storepass $STORE_PASS -noprompt
  done
done

echo "\n\nCertificate exhange DONE!!!"
echo "Copy .jks files to respective server locations\n"

