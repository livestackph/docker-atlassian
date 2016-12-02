# docker-atlassian
Docker Compose for running containers with Atlassian Jira Server and Atlassian Confluence Server using PostgreSQL as database. This version will use Oracle JDK to meet Atlassian's supported platform requirements. OpenJDK can be used but is only recommended for evaluation purpose. Remove java installation if you are planning to use your own java image.

## Containers
* Atlassian Jira
* Atlassian Confluence
* PostgreSQL

## Installation
* Download server-jre-8*-linux-x64.tar.gz from Oracle to ./java directory. The link is on ./java/download-java.txt file.
* Configure database name and users on ./config/dbconfig.env
* Create directories for your data volumes. You need to update docker-compose.yml if you used a different path below.
   * ./data/postgres 
   * ./data/jira
   * ./data/confluence
* Run the containers
```
 docker-compose up 
```
* Setup Jira http://\<docker-host-ip\>:8080
  * Use PostgreSQL as DB
  * Use **db** as host and 5432 as port
  * Use the DB credentials from ./config/dbconfig.env
* Setup Confluence http://\<docker-host-ip\>:8090
  * Use PostgreSQL as DB
  * Use **db** as host and 5432 as port
  * Use the DB credentials from ./config/dbconfig.env
  * Connect Confluence to Jira

## Acknowledgements
* [PostgreSQL Docker](https://hub.docker.com/_/postgres/)
* [Atlassian's Docker Confluence Server](https://bitbucket.org/atlassian/docker-atlassian-confluence-server)
* [Oracle Java on Docker](https://github.com/oracle/docker-images/tree/master/OracleJava)

