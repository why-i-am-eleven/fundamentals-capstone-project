# Incident response runbook

## Preparation
- Maintain incident commander, security, application, cloud operations, legal/privacy and communications contacts.
- Keep an asset inventory, data-flow diagram, escalation tree and evidence-retention procedure.
- Test alert routing and run tabletop exercises.

## Detection and analysis
1. Validate the alert and identify account, region, resource, identity and time window.
2. Determine affected systems, data sensitivity, business impact and likely attack path.
3. Preserve relevant CloudTrail, VPC Flow Logs, WAF/ALB, application, database and endpoint evidence.

## Containment
- For a suspected compromised instance, isolate it using an approved quarantine security group while preserving forensic evidence.
- Disable or rotate compromised credentials and sessions.
- Apply temporary WAF blocks or network restrictions where justified.
- Avoid deleting affected resources or logs before evidence preservation and incident commander approval.

## Eradication and recovery
- Remove persistence and address root cause.
- Rebuild from trusted images and known-good infrastructure code.
- Rotate exposed secrets and keys where compromise is suspected.
- Restore data from a verified backup, validate integrity, then gradually restore traffic.
- Monitor for recurrence and document measured recovery time.

## Post-incident
- Record timeline, root cause, scope, impact, decisions and lessons learned.
- Assign corrective actions with owners and due dates.
- Involve legal/privacy/compliance teams to determine notification obligations.
