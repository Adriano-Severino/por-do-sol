<#
 Configura o ambiente de desenvolvimento do Por do Sol.
 - Cria pastas src/ e lib/ e um programa exemplo se não existirem
 - Compila o compilador/interpretador em modo release
 - Empacota (se necessário) e instala a extensão VS Code a partir de pordosol-language-server
 - Cria a pasta build/ para saídas
#>
param(
    [string]$ProjetoDir = (Split-Path -Parent $PSCommandPath),
    [switch]$NaoInstalarExtensao
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Warn($m){ Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Ok($m){ Write-Host "[OK]  $m" -ForegroundColor Green }
function Fail($m){ Write-Host "[FAIL] $m" -ForegroundColor Red }

Push-Location $ProjetoDir
try {
    Info "Diretório do projeto: $ProjetoDir"

    # 1) Pastas básicas
    foreach ($d in @('src','lib','build')) { if (!(Test-Path $d)) { New-Item -ItemType Directory -Force -Path $d | Out-Null } }
    if (!(Test-Path 'src/programa.pr')) {
        @'
// programa.pr - exemplo inicial
função vazio Principal() 
{
    imprima("Ola, Por do Sol!");
}
'@ | Set-Content -NoNewline 'src/programa.pr' -Encoding UTF8
        Ok "Criado src/programa.pr"
    }

    # 2) Compilar compilador/interpretador (release)
    $cargoToml = Join-Path $ProjetoDir 'compilador-portugues\Cargo.toml'
    if (!(Test-Path $cargoToml)) { throw "Arquivo não encontrado: $cargoToml" }
    Info 'Compilando compilador-portugues (release)...'
    & cargo build --manifest-path $cargoToml --release
    Ok 'Compilação concluída.'

    # 2.1) Mover binários para lib/
    $targetRelease = Join-Path $ProjetoDir 'compilador-portugues\target\release'
    $libDir = Join-Path $ProjetoDir 'lib'
    if (!(Test-Path $libDir)) { New-Item -ItemType Directory -Force -Path $libDir | Out-Null }
    $binarios = @('compilador','interpretador')
    foreach ($b in $binarios) {
        $srcExe = Join-Path $targetRelease ("$b.exe")
        $srcNoExt = Join-Path $targetRelease $b
        $src = if (Test-Path $srcExe) { $srcExe } elseif (Test-Path $srcNoExt) { $srcNoExt } else { $null }
        if ($src) {
            $dest = Join-Path $libDir ([IO.Path]::GetFileName($src))
            try {
                Move-Item -Force -LiteralPath $src -Destination $dest
                Ok ("Movido {0} para lib: {1}" -f $b, $dest)
            } catch {
                Warn ("Não foi possível mover {0}: {1}. Tentando copiar." -f $b, $_)
                try {
                    Copy-Item -Force -LiteralPath $src -Destination $dest
                    Ok ("Copiado {0} para lib: {1}" -f $b, $dest)
                } catch {
                    Warn ("Falha ao copiar {0}: {1}" -f $b, $_)
                }
            }
        } else {
            Warn "Binário não encontrado após build: $b"
        }
    }

    # 3) Extensão VS Code (pack e install)
    if (-not $NaoInstalarExtensao) {
        $extDir = Join-Path $ProjetoDir 'pordosol-language-server'
        if (Test-Path $extDir) {
            $vsix = Get-ChildItem -Path $extDir -Filter '*.vsix' -ErrorAction SilentlyContinue | Select-Object -First 1
            if (-not $vsix) {
                Info 'Empacotando extensão VS Code (pode levar alguns minutos)...'
                Push-Location $extDir
                try {
                    if (!(Test-Path 'node_modules')) { npm install }
                    npm run package
                    $vsix = Get-ChildItem -Path . -Filter '*.vsix' | Select-Object -First 1
                } finally { Pop-Location }
            }
            if ($vsix) {
                $codeCmd = Get-Command code -ErrorAction SilentlyContinue
                if ($codeCmd) {
                    Info "Instalando extensão VS Code: $($vsix.Name)"
                    & code --install-extension $vsix.FullName
                    Ok 'Extensão instalada.'
                } else {
                    Warn 'VS Code CLI não encontrado (code). Pulei a instalação automática do VSIX.'
                }
            } else {
                Warn 'VSIX não encontrado e não foi possível empacotar a extensão.'
            }
        } else {
            Warn 'Pasta pordosol-language-server não encontrada; pulei a instalação da extensão.'
        }
    } else {
        Info 'Instalação da extensão desativada por parâmetro.'
    }

    Ok 'Ambiente configurado com sucesso. Use ./executar.ps1 para compilar e executar seu código.'
} catch {
    Fail $_
    exit 1
} finally {
    Pop-Location
}
