#!/usr/bin/env bash
set -euo pipefail

# Configura o ambiente em Linux/macOS
PROJ_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJ_DIR"

info(){ echo -e "\033[36m[INFO]\033[0m $*"; }
warn(){ echo -e "\033[33m[WARN]\033[0m $*"; }
ok(){ echo -e "\033[32m[OK ]\033[0m $*"; }
fail(){ echo -e "\033[31m[FAIL]\033[0m $*"; }

# 1) Pastas
mkdir -p src lib build
if [[ ! -f src/programa.pr ]]; then
  cat > src/programa.pr <<'PR'
// programa.pr - exemplo inicial
função vazio Principal() 
{
    imprima("Ola, Por do Sol!");
}
PR
  ok "Criado src/programa.pr"
fi

# 2) Compilar compilador/interpretador (release)
info "Compilando compilador-portugues (release)..."
cargo build --manifest-path "$PROJ_DIR/../compilador-portugues/Cargo.toml" --release
ok "Compilação concluída."

# 2.1) Mover binários para lib/
TARGET_RELEASE="$PROJ_DIR/../compilador-portugues/target/release"
LIB_DIR="$PROJ_DIR/lib"
mkdir -p "$LIB_DIR"

BINARIES=("compilador" "interpretador")
for bin in "${BINARIES[@]}"; do
  if [[ -f "$TARGET_RELEASE/$bin" ]]; then
    cp "$TARGET_RELEASE/$bin" "$LIB_DIR/"
    ok "Movido $bin para lib: $LIB_DIR/$bin"
  elif [[ -f "$TARGET_RELEASE/$bin.exe" ]]; then
    cp "$TARGET_RELEASE/$bin.exe" "$LIB_DIR/"
    ok "Movido $bin.exe para lib: $LIB_DIR/$bin.exe"
  else
    warn "Binário não encontrado após build: $bin"
  fi
done

# 2.2) Compilar CLI (ferramentas-cli) e copiar pordosol para lib/
CLI_DIR="$PROJ_DIR/../ferramentas-cli"
if [[ -d "$CLI_DIR" ]]; then
  info "Compilando ferramentas-cli (release)..."
  cargo build --manifest-path "$CLI_DIR/Cargo.toml" --release

  if [[ -f "$CLI_DIR/target/release/pordosol" ]]; then
    cp "$CLI_DIR/target/release/pordosol" "$LIB_DIR/"
    ok "Copiado pordosol para lib: $LIB_DIR/pordosol"
  elif [[ -f "$CLI_DIR/target/release/pordosol.exe" ]]; then
    cp "$CLI_DIR/target/release/pordosol.exe" "$LIB_DIR/"
    ok "Copiado pordosol.exe para lib: $LIB_DIR/pordosol.exe"
  else
    warn "pordosol não encontrado após build do CLI."
  fi
else
  warn "Pasta ferramentas-cli não encontrada; pulei a compilação do CLI."
fi

# 3) Extensão VS Code (pack e install)
if [[ -d ../pordosol-language-server ]]; then
  pushd ../pordosol-language-server >/dev/null
  if [[ ! -f *.vsix ]]; then
    info "Empacotando extensão VS Code..."
    [[ -d node_modules ]] || npm install
    npm run package
  fi
  VSIX=$(ls -1 *.vsix 2>/dev/null | head -n1 || true)
  if [[ -n "$VSIX" ]]; then
    if command -v code &>/dev/null; then
      info "Instalando extensão VS Code: $VSIX"
      code --install-extension "$VSIX"
      ok "Extensão instalada."
    else
      warn "VS Code CLI (code) não encontrado. Pulei a instalação do VSIX."
    fi
  else
    warn "VSIX não encontrado e não foi possível empacotar."
  fi
  popd >/dev/null
else
  warn "Pasta pordosol-language-server não encontrada; pulei a instalação da extensão."
fi

ok "Ambiente configurado. Use ./executar.sh para compilar/rodar."
