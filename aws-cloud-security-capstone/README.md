# Secure Cloud Migration of a Three-Tier Web Application (AWS)

A GitHub-ready academic capstone project demonstrating the design and security planning for migrating a three-tier web application to AWS.

## Project contents

| Path | Contents |
|---|---|
| `docs/` | Final PDF report and editable PowerPoint presentation |
| `diagrams/` | AWS three-tier architecture diagram |
| `app/api/` | Minimal Flask API sample with health endpoint |
| `app/frontend/` | Static frontend sample |
| `infra/terraform/` | Terraform starter for a segmented AWS VPC and security groups |
| `security/` | Threat register, control mapping, go-live checklist, incident response |
| `tests/` | Local API smoke test and security validation checklist |
| `scripts/` | Helper scripts for local run and AWS identity checks |
| `.github/workflows/` | Basic CI workflow |

## Architecture summary

The proposed design uses:
- Amazon Route 53, CloudFront and AWS WAF at the edge
- Application Load Balancer in public subnets
- EC2 Auto Scaling application tier in private subnets
- Amazon RDS for PostgreSQL in isolated database subnets
- IAM, KMS, Secrets Manager, CloudTrail, GuardDuty, Security Hub, AWS Config and CloudWatch

See [`diagrams/aws_three_tier_architecture.png`](diagrams/aws_three_tier_architecture.png) and the full report in `docs/`.

## Important status and safety notice

**This repository is a project blueprint and starter implementation, not a deployed AWS environment.** The Terraform included here creates foundational networking and security groups only. It does not provision the complete production architecture, application load balancer, EC2 Auto Scaling group, CloudFront, WAF, RDS, monitoring stack, or compliance certification.

Do not use this starter configuration as-is for production. Review CIDR ranges, account policies, encryption, logging, egress controls, costs, service quotas and organizational requirements before deployment. Never commit AWS credentials, private keys, database passwords, `.tfstate` files, or real customer data.

## Run the sample application locally

Requirements: Python 3.10+ and pip.

```bash
cd app/api
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate
pip install -r requirements.txt
python app.py
```

API endpoints:
- `GET http://127.0.0.1:5000/` – basic API information
- `GET http://127.0.0.1:5000/health` – health check

Open `app/frontend/index.html` in a browser for the static frontend mockup. It calls the local API only when the API is running.

## Terraform starter

Requirements: Terraform 1.6+ and AWS CLI configured through an approved profile/role.

```bash
cd infra/terraform
terraform init
terraform fmt -check
terraform validate
terraform plan
```

The Terraform files create a VPC, public/private/database subnet layout, an internet gateway, route tables and restrictive security groups. `terraform apply` will create billable AWS resources. Review the plan and cost implications first. No resource is created until you explicitly run `terraform apply`.

## Security and compliance documents

- [`security/threat-register.csv`](security/threat-register.csv)
- [`security/nist-iso-control-mapping.csv`](security/nist-iso-control-mapping.csv)
- [`security/go-live-checklist.md`](security/go-live-checklist.md)
- [`security/incident-response-runbook.md`](security/incident-response-runbook.md)
- [`security/shared-responsibility.md`](security/shared-responsibility.md)

The mapping to NIST CSF 2.0 and ISO/IEC 27001:2022 is indicative and does not establish certification or legal compliance. Applicability and evidence must be assessed by the organization.

## CI

GitHub Actions runs Python syntax checks and Terraform formatting/validation when a Terraform version is available. It does not deploy infrastructure.

## Suggested GitHub submission steps

1. Extract the ZIP.
2. Create a new GitHub repository, for example `aws-cloud-security-capstone`.
3. Upload the extracted project folder contents (not the ZIP itself if your instructor expects browsable source files), or use Git:

```bash
git init
git add .
git commit -m "Initial AWS cloud security capstone submission"
git branch -M main
git remote add origin https://github.com/<YOUR-USERNAME>/aws-cloud-security-capstone.git
git push -u origin main
```

4. Add your own name, student ID (only if required by your institution), course, instructor and submission date to the report/README before submitting.
5. If your instructor requires proof of implementation, deploy in a sandbox account and add genuine screenshots/test results under `docs/evidence/`. Do not fabricate deployment evidence.

## Estimated monthly cost

See the cost model in the PDF report. It is a planning range only; use the AWS Pricing Calculator with actual region, traffic, storage, retention and sizing before approval.

## References

- AWS Well-Architected Security Pillar: https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/
- AWS Shared Responsibility Model: https://docs.aws.amazon.com/wellarchitected/latest/framework/sec-shared-responsibility.html
- AWS Pricing Calculator: https://calculator.aws/
- NIST Cybersecurity Framework 2.0: https://www.nist.gov/cyberframework
