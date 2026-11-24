# AWS shared responsibility summary

AWS is responsible for security **of** the cloud, including physical facilities, hardware, and foundational infrastructure. The customer is responsible for security **in** the cloud, with the exact split depending on the service selected.

| Area | AWS responsibility | Customer responsibility |
|---|---|---|
| Physical facilities and core infrastructure | Operate and protect | Review provider assurance and service scope |
| VPC, subnets, routes, security groups | Provide service capabilities | Configure and monitor correctly |
| EC2 guest OS | Underlying infrastructure | Patch, harden and monitor guest OS and software |
| RDS managed service | Managed host/service layers | Database users, schema, data, access, configuration choices |
| Application | AWS provides hosting services | Secure code, authorization, dependencies and data handling |
| Identity and data | IAM/KMS services | Policies, credential lifecycle, classification, retention and lawful processing |

This summary is educational and must be checked against the current AWS shared responsibility documentation and each selected service.
