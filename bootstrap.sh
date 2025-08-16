#!/usr/bin/env bash
set -euo pipefail

DESTINO="${1:-$(pwd)/por-do-sol}"

declare -A REPOS=(
  [compilador-portugues]='https://github.com/Adriano-Severino/compilador-portugues.git'
  [ferramentas-cli]='https://github.com/Adriano-Severino/ferramentas-cli.git'
  [net-por-do-sol]='https://github.com/Adriano-Severino/net-por-do-sol.git'
  [pordosol-language-server]='https://github.com/Adriano-Severino/pordosol-language-server.git'
  [sistema-padrao]='https://github.com/Adriano-Severino/sistema-padrao.git'
)

echo "Criando pasta: $DESTINO"
mkdir -p "$DESTINO"
cd "$DESTINO"

for dir in "${!REPOS[@]}"; do
  url="${REPOS[$dir]}"
  if [[ ! -d "$dir" ]]; then
    echo "Clonando $url em $dir..."
    git clone "$url" "$dir"
  else
    echo "Diretório $dir já existe. Pulando clone."
  fi
done

# Copiar LICENSE e README se existirem ao lado do script agregador
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[[ -f "$SCRIPT_DIR/LICENSE" ]] && cp -f "$SCRIPT_DIR/LICENSE" "$DESTINO/LICENSE"
[[ -f "$SCRIPT_DIR/README.md" ]] && cp -f "$SCRIPT_DIR/README.md" "$DESTINO/README.md"

echo "Concluído. Estrutura criada em: $DESTINO"
