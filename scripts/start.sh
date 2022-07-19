#!/bin/bash

# Get the ENV variables from .env
export $(grep -v '^#' .env | xargs)

cp ./config.yml ./services/did_communication_api_v2/did_communication_api/config/config.yml
cp ./config.yml ./services/ssi_access_decision_point/ssi_access_decision_point/config/config.yml
cp ./config.yml ./services/vc_jwt_verifier/vc_jwt_verifier/config/config.yml

# Start the project using docker-compose
docker-compose up --build
