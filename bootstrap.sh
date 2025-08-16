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
    echo "Diret??rio $dir j?? existe. Pulando clone."
  fi
done

# Copiar LICENSE e README se existirem ao lado do script agregador
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# C??pia segura: s?? copia se o destino n??o for exatamente o mesmo arquivo
if [[ -f "$SCRIPT_DIR/LICENSE" ]]; then
  src="$SCRIPT_DIR/LICENSE"; dest="$DESTINO/LICENSE"
  if [[ ! -e "$dest" || ! "$src" -ef "$dest" ]]; then
    cp -f "$src" "$dest"
  fi
fi
if [[ -f "$SCRIPT_DIR/README.md" ]]; then
  src="$SCRIPT_DIR/README.md"; dest="$DESTINO/README.md"
  if [[ ! -e "$dest" || ! "$src" -ef "$dest" ]]; then
    cp -f "$src" "$dest"
  fi
fi

echo "Conclu??do. Estrutura criada em: $DESTINO"
