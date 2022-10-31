#!/bin/bash

################################################
# Build the Executable Jar file
################################################
mvn clean package

################################################
# Run the test program
################################################
java -jar ./target/MoP-1.0-jar-with-dependencies.jar