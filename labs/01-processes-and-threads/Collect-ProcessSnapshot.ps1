[CmdletBinding()]
param([string]$OutputDirectory = ".\artifacts")

# Read-only process/thread snapshot. No process is modified or terminated.
$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$os = Get-CimInstance Win32_OperatingSystem
$processes = Get-CimInstance Win32_Process |
    Select-Object ProcessId, ParentProcessId, Name, ExecutablePath, CreationDate

$threads = foreach ($p in $processes) {
    $proc = $null
    try {
        $proc = [System.Diagnostics.Process]::GetProcessById([int]$p.ProcessId)
        foreach ($thread in $proc.Threads) {
            [pscustomobject]@{
                ProcessId = $p.ProcessId
                ProcessName = $p.Name
                ThreadId = $thread.Id
                ThreadState = [string]$thread.ThreadState
                ThreadPriority = [string]$thread.PriorityLevel
            }
        }
    }
    catch {
        [pscustomobject]@{
            ProcessId = $p.ProcessId
            ProcessName = $p.Name
            ThreadId = $null
            ThreadState = "Unavailable"
            ThreadPriority = "Unavailable"
        }
    }
    finally {
        if ($null -ne $proc) { $proc.Dispose() }
    }
}

$metadata = [pscustomobject]@{
    CollectedAt = (Get-Date).ToString("o")
    OS = $os.Caption
    OSVersion = $os.Version
    BuildNumber = $os.BuildNumber
    Architecture = $env:PROCESSOR_ARCHITECTURE
    PowerShellVersion = $PSVersionTable.PSVersion.ToString()
    ProcessCount = @($processes).Count
    ThreadRows = @($threads).Count
}
$processes | Export-Csv -NoTypeInformation -Encoding UTF8 -Path (Join-Path $OutputDirectory "processes-$stamp.csv")
$threads | Export-Csv -NoTypeInformation -Encoding UTF8 -Path (Join-Path $OutputDirectory "threads-$stamp.csv")
$metadata | ConvertTo-Json -Depth 4 | Set-Content -Encoding UTF8 -Path (Join-Path $OutputDirectory "environment-$stamp.json")
Write-Output "Snapshot written to $OutputDirectory"
Write-Output "Process exit races and access restrictions are expected limitations."
