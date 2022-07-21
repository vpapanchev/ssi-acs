# Interoperable Access Control System (ACS) based on Self-Sovereign Identities (SSI)

## Description

This project provides automated scripts for deploying and starting the Microservice architecture of the Interoperable ACS based on Self-Sovereign Identities. The system consists of the following components:
- [DIF Universal Resolver](https://github.com/decentralized-identity/universal-resolver) - A driver-based architecture developed by the Decentralized Identity Foundation (DIF) for resolving multiple types of Decentralized Identifiers (DIDs).
- [Indy-DID-Driver](https://github.com/vpapanchev/indy-did-resolver) - A local fork of [Indy-DID-Resolver](https://github.com/IDunion/indy-did-resolver) provided by IDunion.
- [Uport-DID-Driver](https://github.com/uport-project/uport-did-driver) - Driver for the uPort DID methods (Ethr-DIDs) to be used in the Universal Resolver architecture.
- [DID Communication API](https://github.com/vpapanchev/did-comm-api) - Inbox HTTP API for secure communication using [DIDComm Messaging Protocol](https://identity.foundation/didcomm-messaging/spec/) and [Peer-DIDs](https://identity.foundation/peer-did-method-spec/). 
- [VC JWT Verifier](https://github.com/vpapanchev/vc-jwt-verifier) - Verification of [JSON-LD Verifiable Credentials expressed as JSON Web Tokens (JWTs)](https://www.w3.org/TR/vc-data-model/#json-web-token)
- [Access Decision Point](https://github.com/vpapanchev/ssi-adp) - The core component of the ACS implementing multiple microservices - definition and management of the Access Control Logic (based on required Verifiable Credentials), creation of Verifiable Presentation Requests and verification of Verifiable Presentations, exchange of credentials and API for communication with the DID Communication API

To use the Access Control System, an SSI-Client implementation with some specific functionality is required. An [example implementation](https://github.com/vpapanchev/ssi-acs-client) of such SSI-Client is provided.

Currently, the system supports two DID Methods - Ethr-DIDs on any Ethereum network (we have mainly used the Ropsten Testnetwork) and Indy-DIDs on a locally-deployed [VON Network](https://github.com/bcgov/von-network).

The example SSI-Client implementation also contains a local wallet (in the form of a simple JSON file) which contains multiple DIDs (with their respective private keys) and Verifiable Credentials. To use these DIDs, the deployment of a local VON Network and registration of the DIDs is required.

## Deploying a VON Network and Registering DIDs

Deploy and start a local VON Network as explained [here](https://github.com/bcgov/von-network/blob/main/docs/UsingVONNetwork.md).

Register the DIDs using the following Seeds:
- /VbVPd0VcoBRah/eM6ZhiHbXeAx5I0U2
- wrOg38cR4Fn+hmYg6kVBxf8oTLenPHY+
- MBbR8gNyW5zchfvGfh4mvd71FnWdH02d
- f28ScnGNTQcrVZAKbbj2w3NVPDjgtjEp
- ATkOdnmB22BxtyGp1DhY47ANhCLCh69I

## Usage

0. Deploy a local VON Network and registed the used DIDs.
1. Swap the content of the [von-genesis-file](https://github.com/vpapanchev/ssi-acs/blob/main/von_network_genesis) with the genesis transactions of your own VON Network
2. Edit the [configuration file](https://github.com/vpapanchev/ssi-acs/blob/main/config.yml) to configure the services if needed.
3. Edit the [Access Control File](https://github.com/vpapanchev/ssi-acs/blob/main/access.control.ttl) to configure the authorization rules if needed.
4. Fetch all microservices by running: \
`./scripts/get_services.sh`
5. Configure the VON Network of the Indy-DID-Driver: \
`./scripts/set_von_network.sh`
6. Start the ACS: \
`./scripts/start.sh`
7. Send requests to the ACS using the automated scripts provided by the example [SSI-Client](https://github.com/vpapanchev/ssi-acs-client) implementation

## Project Status

The project was created as a prototype used for evaluating purposes and might not be actively supported in the future.
