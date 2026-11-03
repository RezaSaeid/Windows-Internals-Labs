# Windows Internals Labs

Reproducible Windows internals experiments in isolated Windows virtual machines.

> **Status:** Learning and research portfolio. A lab is complete only when personally executed, evidenced, interpreted, and reproducible.

## Scope
Processes, threads, handles, object management, virtual memory, PE loading, services, modules, debugging, and system observability.

## Start here
- [Learning roadmap](docs/learning-roadmap.md)
- [Evidence standard](docs/evidence-standard.md)
- [Lab 01 — Process and Thread Snapshot](labs/01-processes-and-threads/README.md)
- [Read-only snapshot collector](labs/01-processes-and-threads/Collect-ProcessSnapshot.ps1)
- [Lab report template](templates/lab-report-template.md)

## Environment
Windows 10/11 x64 VM, PowerShell, built-in Windows utilities, optional Sysinternals tools, and VM snapshots.

## Research standard
Record exact OS build, architecture, tool versions, commands, observations, limitations, and cleanup. Separate raw observations from interpretation. Sanitize machine identifiers and private paths.

## Safety
Use disposable, isolated VMs. Do not run destructive tests on production systems or systems without explicit authorization.
