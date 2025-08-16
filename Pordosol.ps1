param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Args
)
$scriptDir = Split-Path -Parent $PSCommandPath
$exe = Join-Path $scriptDir 'por-do-sol\lib\pordosol.exe'
if (!(Test-Path $exe)) {
    Write-Error "pordosol.exe não encontrado em $exe. Rode configurar-ambiente.ps1 e compile ferramentas-cli."
    exit 1
}
& $exe @Args
