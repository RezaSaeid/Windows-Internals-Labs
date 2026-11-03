# Windows Internals — Architecture & Case Study

> Educational synthetic model only. No live-system measurements are claimed.

## Architecture

A process investigation must distinguish the process object, its threads, its virtual address space, and its handle table. Threads belonging to one process ordinarily share that process's address space; they do not each own an independent process address space.

~~~mermaid
flowchart TB
 U[User application] --> P[Process]
 P --> T1[Thread A]
 P --> T2[Thread B]
 P --> V[Virtual address space]
 P --> H[Handle table]
 H --> O[Referenced kernel objects]
 T1 --> S[Scheduler]
 T2 --> S
~~~

## Synthetic case: apparent memory growth

An operator sees a process memory counter rise across two samples and asks whether this proves a leak. It does not. The counter's semantics and a comparable time series are required.

| Metric | Meaning | Does not prove |
|---|---|---|
| Working set | Resident pages attributed to process | Total committed memory or a leak |
| Private working set | Resident private pages | All private committed memory |
| Private bytes/commit | Private committed virtual memory | Unreachable allocations |
| Virtual size | Reservations and mappings | Physical RAM use |
| Handle count | Open handles at sample time | Handle leak without trend/ownership |
| Thread count | Threads at sample time | Thread leak without lifecycle evidence |

## Evidence model

Record UTC timestamp, sampling interval, PID plus process creation time (PID reuse matters), image path, architecture, counter source/name/units, collector version, privilege context, and errors. Use the same counter source and workload across samples.

## Analysis workflow

1. Define whether the question concerns residency, commitment, address space, handles, or threads.
2. Capture repeated samples under a documented, comparable workload.
3. Compare trends rather than isolated values.
4. Correlate process creation time as well as PID.
5. If justified, inspect allocation or handle ownership with debugger/tracing evidence.
6. Document alternative explanations and confidence.

## Example conclusion

**Inconclusive:** a synthetic time series could show increasing private commit. This alone does not establish a leak, root cause, or security impact. Further evidence would require repeatable workload, longer sampling, and allocation-owner correlation.

## Quality gates

- [ ] Counter semantics and units defined.
- [ ] PID reuse addressed.
- [ ] Samples timestamped and comparable.
- [ ] Working set not conflated with virtual size or private commit.
- [ ] Observations separated from hypotheses.
- [ ] Synthetic data never represented as measured results.

## References

- [Processes and Threads](https://learn.microsoft.com/windows/win32/procthread/processes-and-threads)
- [Memory Performance Information](https://learn.microsoft.com/windows/win32/memory/memory-performance-information)
- [GetProcessMemoryInfo](https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-getprocessmemoryinfo)
