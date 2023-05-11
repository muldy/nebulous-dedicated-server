#! /bin/bash

echo "Checking DedicatedServerConfig.xml syntax...."
xmllint --encode utf-8 DedicatedServerConfig.xml && ./NebulousDedicatedServer
