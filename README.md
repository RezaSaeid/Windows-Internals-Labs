# Windows Internals Labs

Hands-on, reproducible experiments for understanding Windows internals in isolated Windows virtual machines.

> **Status:** Learning and research portfolio. Exercises are marked complete only after they have been performed and documented with evidence.

## Research areas
- Processes, threads, handles, and object management
- Virtual memory, address spaces, and working sets
- PE loading, modules, and loader behavior
- Windows services and process creation
- User-mode debugging and introductory kernel concepts
- Event tracing and system observability

## Repository layout
```text
labs/
  01-processes-and-threads/
  02-virtual-memory/
  03-handles-and-objects/
  04-services-and-modules/
notes/
templates/
  lab-report-template.md
```

## Lab environment
- Windows 10/11 x64 virtual machine (VMware or VirtualBox)
- PowerShell and built-in Windows utilities
- Sysinternals tools where appropriate
- VM snapshots before experiments

## Documentation standard
Each completed lab records its objective, prerequisites, exact steps, observations, evidence, interpretation, limitations, and cleanup. Start with the [lab report template](templates/lab-report-template.md).

## Safety
Use disposable, isolated VMs. Do not run destructive tests on production systems or systems without explicit authorization.

## Progress
Planned exercises are not represented as completed research. Findings will include environment details and reproducible evidence.
