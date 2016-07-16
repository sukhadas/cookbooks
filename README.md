# Cookbooks
> The repository contains the cookbooks required to setup a Load balancer for running instances of Web Application on Tomcat.

### Assumptions
  - Static IP is used
  - Java is installed

### Technologies used:
  - Application development: Java
  - Build tool: Maven
  - Application Server: Tomcat7
  - Service Registration and Discovery: Consul
  - Load Balancer: HAProxy
  - Auto Update for HAProxy: Using Consul Template
  - Health Checking for Application: Consul Template
  - Configuration management: Chef
