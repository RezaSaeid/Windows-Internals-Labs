[CmdletBinding()]
param(
    [string]$OutputPath = ".\artifacts\process-memory.csv",
    [int]$Top = 25
)

# Read-only user-mode process memory metadata. This does not read arbitrary
# process memory, inject code, change protection, or alter process state.
$ErrorActionPreference = "Stop"
if ($Top -lt 1 -or $Top -gt 500) { throw "Top must be between 1 and 500." }

$rows = foreach ($p in [System.Diagnostics.Process]::GetProcesses()) {
    try {
        [pscustomobject]@{
            ProcessId = $p.Id
            ProcessName = $p.ProcessName
            WorkingSetBytes = [int64]$p.WorkingSet64
            PrivateBytes = [int64]$p.PrivateMemorySize64
            VirtualBytes = [int64]$p.VirtualMemorySize64
            HandleCount = [int]$p.HandleCount
            Responding = $(try { [bool]$p.Responding } catch { $null })
            CollectionStatus = "Collected"
        }
    } catch {
        [pscustomobject]@{
            ProcessId = $p.Id; ProcessName = $p.ProcessName
            WorkingSetBytes = $null; PrivateBytes = $null
            VirtualBytes = $null; HandleCount = $null
            Responding = $null; CollectionStatus = "AccessDeniedOrExited"
        }
    } finally {
        $p.Dispose()
    }
}

$parent = Split-Path -Parent $OutputPath
if ($parent -and -not (Test-Path -LiteralPath $parent)) {
    New-Item -ItemType Directory -Path $parent -Force | Out-Null
}
$rows | Sort-Object WorkingSetBytes -Descending | Select-Object -First $Top |
    Export-Csv -NoTypeInformation -Encoding UTF8 -Path $OutputPath
Write-Output ("Wrote {0} process records to {1}" -f @($rows).Count, $OutputPath)
Write-Output "Values are point-in-time process metadata; they are not a memory dump."
