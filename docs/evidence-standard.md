# Evidence and Reporting Standard

Every report must be reproducible and distinguish observation from interpretation.

## Required sections
1. Objective and testable question
2. Authorization and scope
3. Environment: OS build, architecture, tools and versions, VM snapshot
4. Procedure: exact commands or UI steps, sanitized
5. Observations: output, timestamps, screenshots, logs
6. Analysis: what evidence supports and does not support
7. Limitations and possible measurement effects
8. Cleanup and rollback
9. References

## Rules
- Never fabricate output, screenshots, timestamps, or measurements.
- Label illustrative examples as synthetic, not observed.
- Keep original artifacts private; publish sanitized excerpts only.
- Redact usernames, hostnames, IPs, serials, tokens, and private paths.
- A lab is complete only when another reader can reproduce and understand it.
