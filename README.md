# Description
The project gets you quickly started using and learning the Java jooq framework http://www.jooq.org. Docker is used to setup a database for testing queries against the sample database.
# Prerequisites
Make sure you have a Java 8 SDK, Maven and Docker installed in latest versions.
# Usage
## Database
The scripts related to the MySql database are located in

    cd src/main/resources/database
### Start the MySql database
    bash create_mysql_container.bash
### Stop the MySql database
    bash remove_mysql_container.bash
### Adapt the MySql database
    vim migration/*.sql
    bash remove_mysql_container.bash
    bash create_mysql_container.bash
## Jooq code generation
Start the database as described above and then

    mvn clean generate-sources -P jooq-codegen
    cd src/main/generated-java