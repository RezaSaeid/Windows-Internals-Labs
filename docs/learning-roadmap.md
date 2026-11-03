# Windows Internals Learning Roadmap

A lab is complete only after the procedure, environment, observations, and interpretation are recorded.

## Environment
- Windows 10/11 x64 disposable VM; take a snapshot first.
- Record OS build, architecture, PowerShell version, and tool versions.
- Sanitize usernames, hostnames, private paths, and identifiers before publishing.

## Sequence

| Stage | Lab | Completion evidence |
|---|---|---|
| 1 | PID and PPID | Process inventory; explain process identity and parent-child relationship |
| 1 | Process vs thread | Inventory one benign application; explain process container vs execution unit |
| 1 | Thread states and priorities | Capture state/priority observations; explain waiting vs stalled |
| 2 | Handles and objects | Examples of handles; distinguish handle from kernel object |
| 2 | Virtual memory vs working set | Measurements and explanation of address space vs resident pages |
| 2 | PE image basics | Architecture, image base, sections, entry point from a benign binary |
| 3 | Services and drivers | Inventory and explain service state/start type |
| 3 | User-mode debugging | WinDbg session notes, stack, registers, modules |
| 4 | Crash dump fundamentals | Sample dump analysis; separate facts from hypotheses |

Start with the process/thread lab using a harmless application such as Notepad. Mark status as Not Started, In Progress, Blocked, or Completed. Reading alone is not completion.
