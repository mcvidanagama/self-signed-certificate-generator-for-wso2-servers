# self-signed-certificate-generator-for-wso2-servers

### This bash script will generate self certificates for a set of wso2 products and will update all keystores and truststores.

> This repo is related to the medium article https://medium.com/@mcvidanagama/exchanging-self-signed-certificates-for-wso2-servers-6db83b5e806f

## How to use :
##### 1. Clone the Repo
##### 2. Create folders with required server hostnames inside cloned dir
    eg : 
       - store.apim.dev.mycompany.com
       - publisher.apim.dev.mycompany.com
       - ei.dev.mycompany.com
       - eian.dev.mycompany.com
       - iam.dev.mycompany.com
       - apiman.dev.mycompany.com

##### 3. Copy .jks files from wso2 servers to above created folders
        |---exchange_certificates.sh
        ├── apim.dev.mycompany.com
        │   ├── client-truststore.jks
        │   └── wso2carbon.jks
        ├── apiman.dev.mycompany.com
        │   ├── client-truststore.jks
        │   └── wso2carbon.jks
        ├── ei.dev.mycompany.com
        │   ├── client-truststore.jks
        │   └── wso2carbon.jks
        ├── eian.dev.mycompany.com
        │   ├── client-truststore.jks
        │   └── wso2carbon.jks
        └── iam.dev.mycompany.com
            ├── client-truststore.jks
            └── wso2carbon.jks
##### 4. Open exchange_certificates.sh from a text editor and set values for variables
        STORE_PASS="wso2carbon" #keystore/client truststore  password
        VALIDITY="3650"         #validity period(in days) for the generated key. eg: 3650 = 10 years
        OU="Services"           #Organization Unit
        O= "My Company"         #Name of the Organization
        L="Colombo"             #Locality or City   
        S="Western"             #State or Province
        C="LK"                  #Two letter country code


##### 5. Run script
      sh exchange_certificates.sh

##### 6. Copy updated .jks files to the relavant WSO2 servers back.

##### 7. Open conf/carbon.xml in each server and change the value of <KeyAlias> with relavent hostnames (hostnames=folder names as in step 2)
         eg: <KeyAlias>apim.dev.mycompany.com</KeyAlias>
