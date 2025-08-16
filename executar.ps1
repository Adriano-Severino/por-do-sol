<#
 Compila e executa um programa Por do Sol.
 - Modo bytecode: gera .pbc e roda no interpretador (padrão)
 - Modo llvm: quando suportado, gera binário nativo e executa
#>
param(
    [string]$Entrada = 'src/programa.pr',
    [ValidateSet('bytecode','llvm')][string]$Alvo = 'bytecode',
    [switch]$Debug
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Warn($m){ Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Ok($m){ Write-Host "[OK]  $m" -ForegroundColor Green }
function Fail($m){ Write-Host "[FAIL] $m" -ForegroundColor Red }

$Raiz = Split-Path -Parent $PSCommandPath
Push-Location $Raiz
try {
    if (!(Test-Path $Entrada)) { throw "Arquivo de entrada não encontrado: $Entrada" }

    $cargoToml = Join-Path $Raiz 'compilador-portugues\Cargo.toml'
    if (!(Test-Path $cargoToml)) { throw "Arquivo não encontrado: $cargoToml" }

    $buildDir = Join-Path $Raiz 'build'
    if (!(Test-Path $buildDir)) { New-Item -ItemType Directory -Force -Path $buildDir | Out-Null }

    $EntradaAbs = (Resolve-Path -LiteralPath $Entrada).Path
    $nomeBase = [System.IO.Path]::GetFileNameWithoutExtension($EntradaAbs)

    switch ($Alvo) {
        'bytecode' {
            Info 'Compilando para bytecode (.pbc)...'
            Push-Location $buildDir
            try {
                & cargo run --manifest-path $cargoToml --release -- $EntradaAbs --target=bytecode
                Ok 'Bytecode gerado.'
            } finally { Pop-Location }

            $interp = Join-Path $Raiz 'compilador-portugues\target\release\interpretador.exe'
            if (!(Test-Path $interp)) { $interp = (Get-ChildItem -Recurse -Filter 'interpretador*.exe' -Path (Join-Path $Raiz 'compilador-portugues\target\release') -ErrorAction SilentlyContinue | Select-Object -First 1).FullName }
            if (!$interp -or !(Test-Path $interp)) { throw 'Interpretador não encontrado após build.' }

            $pbc = Join-Path $buildDir ("$nomeBase.pbc")
            Info 'Executando interpretador...'
            if ($Debug) {
                & $interp $pbc --debug
            } else {
                & $interp $pbc
            }
        }
        'llvm' {
            Info 'Compilando (alvo LLVM) para binário nativo...'
            Push-Location $buildDir
            try {
                & cargo run --manifest-path $cargoToml --release -- $EntradaAbs --target=llvm-ir
            } finally { Pop-Location }
            # Nome do executável gerado segue o nome-base do arquivo de entrada
            $exeSemExt = Join-Path $buildDir $nomeBase
            $exeComExt = "$exeSemExt.exe"
            $exeOut = if (Test-Path $exeComExt) { $exeComExt } elseif (Test-Path $exeSemExt) { $exeSemExt } else { $null }
            if (-not $exeOut) { throw "Binário não encontrado após compilação LLVM (procurei '$exeComExt' e '$exeSemExt'). Verifique se o clang está instalado e no PATH." }
            Ok "Binário gerado: $exeOut"
            Info 'Executando binário...'
            & $exeOut
        }
    }
} catch {
    Fail $_
    exit 1
} finally {
    Pop-Location
}
