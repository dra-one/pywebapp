#!/bin/bash
$(aws ecr get-login --region us-west-2 --no-include-email)
docker pull 528750802158.dkr.ecr.us-west-2.amazonaws.com/dra-one/pywebapp:latest || {
            
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 528750802158.dkr.ecr.us-west-2.amazonaws.com/dra-one/pywebapp:latest
