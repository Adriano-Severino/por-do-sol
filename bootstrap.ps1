param(
    [string]$Destino = "$PWD/por-do-sol"
)

$repos = @(
    @{ url = 'https://github.com/Adriano-Severino/compilador-portugues.git';    dir = 'compilador-portugues' },
    @{ url = 'https://github.com/Adriano-Severino/ferramentas-cli.git';        dir = 'ferramentas-cli' },
    @{ url = 'https://github.com/Adriano-Severino/net-por-do-sol.git';         dir = 'net-por-do-sol' },
    @{ url = 'https://github.com/Adriano-Severino/pordosol-language-server.git'; dir = 'pordosol-language-server' },
    @{ url = 'https://github.com/Adriano-Severino/sistema-padrao.git';         dir = 'sistema-padrao' }
)

Write-Host "Criando pasta: $Destino"
New-Item -ItemType Directory -Force -Path $Destino | Out-Null

Push-Location $Destino

foreach ($r in $repos) {
    $dir = $r.dir
    $url = $r.url
    if (-not (Test-Path $dir)) {
        Write-Host "Clonando $url em $dir..."
        git clone $url $dir
    } else {
        Write-Host "Diretório $dir já existe. Pulando clone."
    }
}

# Copia LICENSE e README do repo agregador se existirem ao lado do script
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$lic = Join-Path $root 'LICENSE'
$readme = Join-Path $root 'README.md'
if (Test-Path $lic) { Copy-Item $lic -Destination (Join-Path $PWD 'LICENSE') -Force }
if (Test-Path $readme) { Copy-Item $readme -Destination (Join-Path $PWD 'README.md') -Force }

Pop-Location

Write-Host "Concluído. Estrutura criada em: $Destino"
