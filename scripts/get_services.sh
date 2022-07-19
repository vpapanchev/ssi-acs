#!/bin/bash

mkdir services
cd services

git clone https://github.com/vpapanchev/did-comm-api.git did_communication_api_v2
git clone https://github.com/vpapanchev/vc-jwt-verifier.git vc_jwt_verifier
git clone https://github.com/vpapanchev/ssi-adp.git ssi_access_decision_point

git clone https://github.com/vpapanchev/indy-did-resolver.git
git clone https://github.com/vpapanchev/universal-resolver.git
