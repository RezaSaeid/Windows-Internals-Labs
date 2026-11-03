# Windows Internals Labs

A structured research workspace for observing and explaining Windows process, thread, memory, object, and execution behavior in isolated Windows virtual machines.

> **Portfolio status:** Learning and research material. A lab is marked complete only after it has been personally executed, evidenced, interpreted, and made reproducible. Planned work and illustrative output are never presented as observed results.

## What this repository is intended to demonstrate

- Understanding of Windows process and thread execution models.
- Ability to collect system state with documented, read-only methods.
- Interpretation of memory and handle metrics without confusing distinct kernel concepts.
- Evidence-driven technical writing that separates measurements from conclusions.

## Research areas

Processes and threads, handles, object management, virtual memory, PE loading, services, modules, debugging, and system observability.

## Start here
- [Technical analysis framework](docs/technical-analysis-framework.md)

- [Learning roadmap](docs/learning-roadmap.md)
- [Evidence and reporting standard](docs/evidence-standard.md)
- [Lab 01 — Process and Thread Snapshot](labs/01-processes-and-threads/README.md)
- [Read-only process snapshot collector](labs/01-processes-and-threads/Collect-ProcessSnapshot.ps1)
- [Lab report template](templates/lab-report-template.md)

## Engineering approach

Each investigation should define a question before collecting data, identify the Windows build and architecture, record the collection method, and explain what each metric does—and does not—establish. For example, working-set size, private bytes, virtual address-space size, and committed memory are not interchangeable measurements.

Reports should include raw observations, interpretation, measurement limitations, and enough detail for another researcher to reproduce the collection.

## Environment

Windows 10/11 x64 VM, PowerShell, built-in Windows utilities, optional Sysinternals tools, and VM snapshots.

## Current maturity and evidence

This repository contains learning material, collection tooling, and report structures. Individual experiments must be treated as **not completed** until their reports include actual environment details and captured evidence. The presence of a script or lab guide is not evidence that the corresponding experiment has been run.

## Safety and data handling

Use disposable, isolated VMs. Do not run destructive tests on production systems or systems without explicit authorization. Sanitize machine identifiers, usernames, private paths, and sensitive process data before publication.

## Architecture & Technical Case Study

See [the architecture and technical case study](docs/case-study-and-architecture.md) for the domain-specific system model, analysis workflow, evidence requirements, and quality gates.
