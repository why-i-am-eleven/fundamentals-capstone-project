# Security validation checklist

Use only an authorized non-production environment.

- [ ] Public internet cannot reach the database endpoint.
- [ ] Database accepts connections only from the application security group.
- [ ] Application instances have no public IP and no inbound SSH/RDP.
- [ ] Session Manager access is restricted to approved operators.
- [ ] S3 Block Public Access and bucket policies prevent unintended anonymous access.
- [ ] TLS is enforced at edge and application-to-database paths.
- [ ] IAM role policy review confirms no unnecessary wildcard permissions.
- [ ] CloudTrail records a controlled IAM or security-group change.
- [ ] GuardDuty/Security Hub alert routing is verified using an approved test method.
- [ ] WAF managed rules and rate limits are tested with safe test requests.
- [ ] Backup restore is performed into an isolated test environment.
- [ ] SAST, dependency scanning and DAST are completed and findings triaged.
- [ ] Application health checks and load tests pass.
- [ ] Rollback procedure is exercised.

Do not conduct intrusive scanning or penetration testing against systems without written authorization.
