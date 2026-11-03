# Lab 01 — Process and Thread Snapshot

## Objective
Collect a timestamped, read-only process/thread snapshot and explain PID, PPID, process identity, and thread state.

## Requirements
- Windows 10/11 x64 disposable VM; take a snapshot first.
- Windows PowerShell 5.1 or PowerShell 7.
- Basic collection is read-only. Some metadata may be unavailable without elevated access.

## Run
From this directory, run:

    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    .\Collect-ProcessSnapshot.ps1 -OutputDirectory .\artifacts

The script writes process CSV, thread CSV, and environment JSON. It does not terminate processes or change system configuration.

## Analysis tasks
1. Pick a benign process such as Notepad and record PID and PPID.
2. Locate its thread rows and count them.
3. Explain why a process can exit between enumeration and inspection.
4. Explain why a waiting thread is not automatically hung.
5. Compare observations with Task Manager or Process Explorer.

## Deliverable
Use the lab report template. Publish only sanitized output. Remove machine names, usernames, private paths, and unrelated process details.

## Limitations
Process and thread state are sampled at different moments. Permissions and process-exit races can cause incomplete rows. .NET thread-state labels are not a complete kernel scheduler trace. A single snapshot does not establish maliciousness or system health.
