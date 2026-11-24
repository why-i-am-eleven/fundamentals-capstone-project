# Production go-live checklist

All entries start as **Pending**. Mark them complete only after retaining evidence.

- [ ] Architecture, data-flow diagram, asset inventory and threat model approved.
- [ ] Account root user protected with MFA; no root access keys; privileged workforce access federated.
- [ ] IAM roles follow least privilege; access review completed; break-glass process tested.
- [ ] No public database endpoint; no public SSH/RDP; application ingress restricted to approved path.
- [ ] S3 Block Public Access enabled; bucket policies reviewed; object access logging considered.
- [ ] TLS enforced; certificates valid; database connections use TLS.
- [ ] RDS, EBS, S3 and backups encrypted as required by classification.
- [ ] Secrets stored in Secrets Manager or approved vault; rotation and retrieval permissions tested.
- [ ] CloudTrail management events delivered and protected; log retention approved.
- [ ] GuardDuty, Security Hub, Config and CloudWatch alerts enabled and routed to owners.
- [ ] SAST, dependency scan, secret scan, DAST and infrastructure scan completed.
- [ ] Critical findings closed; High findings remediated or formally accepted by risk owner.
- [ ] Backup restore and failover test completed; RPO/RTO measured and approved.
- [ ] Load/performance test passed; scaling and rollback behavior verified.
- [ ] Cost estimate, budget alerts and resource tags approved.
- [ ] Runbooks, on-call roster, incident contacts and change plan ready.
- [ ] Compliance evidence register reviewed by security/compliance owner.
- [ ] Business owner and accountable risk owner have signed off.

**Decision:** Production release is blocked until all mandatory gates have evidence and approval.
