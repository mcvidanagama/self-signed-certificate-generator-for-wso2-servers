# self-signe-certificate-generator-for-wso2-servers
This bash script will generate self certificates for a set of wso2 products and will update all keystores and truststores.

How to use :

01. Create folders with required hostnames
  eg : store.apim.dev.mycompany.com
       publisher.apim.dev.mycompany.com
       ei.dev.mycompany.com
       eian.dev.mycompany.com
       iam.dev.mycompany.com
       apiman.dev.mycompany.com

02. Copy .jks files from wso2 server to above created folders
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
            
 03. Run script
      sh exchange_certificates.sh
