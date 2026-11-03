# Windows Internals — Technical Analysis Framework

## Purpose and method
This framework defines a repeatable method for investigating Windows execution and memory behavior. It is not a claim that every investigation has been performed. Keep three categories distinct: observation (directly collected data), interpretation (what it suggests under assumptions), and conclusion (a claim supported by evidence and bounded by limitations).

For each investigation: state a narrow question; identify the documented API or architectural contract; record OS edition/build, architecture, process bitness, privilege, tool version, and VM state; collect with the least invasive method; correlate independent sources where practical; explain units and scope; document races and sampling effects; provide reproducible commands or source revision.

## Process and thread analysis
A process is a resource and security container; a thread is a schedulable execution entity. Record PID together with process creation time because PIDs are reused. Capture image path, architecture where known, parent PID, session and security context where authorized, handle count, and thread count. Parent PID is historical metadata and does not prove that the parent remains alive or that it represents a complete causal history.

For threads, record TID, owning PID, state, wait reason, and priority with source and sample time. Distinguish base priority from current priority. A point-in-time thread state is not a durable description of activity: threads transition asynchronously, so repeated samples are more informative than one snapshot.

## Memory metrics: never conflate them
| Metric | Meaning | Caveat |
|---|---|---|
| Working set | Pages currently resident in a process working set | Changes with trimming, faults, and sampling time |
| Private working set | Resident pages private to the process | Not total private committed memory |
| Private bytes / private commit | Commit charged privately to a process | Not physical RAM currently resident |
| Virtual address space | Reserved, committed, or mapped process ranges | Not all ranges are resident or committed |
| Pagefile / commit charge | Commit accounting, depending on API | Not direct pagefile I/O measurement |

Identify the exact API/property and documented definition. For every metric ask: what unit is returned; is it per-process or system-wide; instantaneous, cumulative, or peak; can access be restricted; can the process exit during collection; and does instrumentation affect timing?

## Handles and objects
A handle is a process-relative reference, not the object itself. A handle count does not identify object type, granted access, or security impact. Record process context, object type where safely available, access rights and inheritance/duplication context when relevant, and the limitations of name resolution. Never publish sensitive object names, tokens, or production handles.

## Evidence and common errors
Reports require the question, hypothesis, environment, tool versions, commands/source revision, sanitized raw output, interpretation, alternative explanations, limitations, and cleanup. Screenshots supplement but do not replace reproducible commands. Synthetic examples must be labelled synthetic.

Avoid: treating PID as permanent identity; treating parent PID as proof of current ancestry; equating working set, private commit, and virtual size; treating one thread state as stable; inferring maliciousness from process name/path; comparing non-simultaneous samples as simultaneous; and reporting undocumented output without tool version.

## Completion gate
Publish only when another reader can recreate the environment and collection method, understand every field and unit, distinguish observation from interpretation, identify limitations, and reproduce the collection without private machine data.

## References
Prefer Microsoft Learn for API contracts, Windows Internals for architectural context, and Sysinternals documentation for tool semantics. Record access date and version dependencies.