#!/usr/bin/env bash
set -euo pipefail

# Compila e executa um programa Por do Sol
PROJ_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJ_DIR"

ENTRADA="${1:-src/programa.pr}"
ALVO="${2:-bytecode}" # bytecode|llvm
DEBUG="${DEBUG:-}" # se set, passa --debug ao interpretador

info(){ echo -e "\033[36m[INFO]\033[0m $*"; }
ok(){ echo -e "\033[32m[OK ]\033[0m $*"; }
fail(){ echo -e "\033[31m[FAIL]\033[0m $*"; }

[[ -f "$ENTRADA" ]] || { fail "Arquivo não encontrado: $ENTRADA"; exit 1; }
mkdir -p build
ENTRADA_ABS="$(python - <<PY
import os,sys
print(os.path.abspath(sys.argv[1]))
PY
" "$ENTRADA")"
NOME_BASE="$(basename "$ENTRADA_ABS" .pr)"

case "$ALVO" in
  bytecode)
    info "Compilando para bytecode (.pbc)..."
    (cd build && cargo run --manifest-path "$PROJ_DIR/compilador-portugues/Cargo.toml" --release -- "$ENTRADA_ABS" --target=bytecode)
    ok "Bytecode gerado."

    INTERP="$(ls -1 "$PROJ_DIR"/compilador-portugues/target/release/interpretador* 2>/dev/null | head -n1 || true)"
    [[ -n "$INTERP" ]] || { fail "Interpretador não encontrado após build."; exit 1; }

    info "Executando interpretador..."
    if [[ -n "$DEBUG" ]]; then
      "$INTERP" "$PROJ_DIR/build/$NOME_BASE.pbc" --debug
    else
      "$INTERP" "$PROJ_DIR/build/$NOME_BASE.pbc"
    fi
    ;;
  llvm)
    info "Compilando (alvo LLVM) para binário nativo..."
    (cd build && cargo run --manifest-path "$PROJ_DIR/compilador-portugues/Cargo.toml" --release -- "$ENTRADA_ABS" --target=llvm-ir)
    ok "LLVM IR gerado e compilado via clang (pelo compilador)."
    EXE="$PROJ_DIR/build/$NOME_BASE"
    [[ -x "$EXE" || -x "$EXE.exe" ]] || { fail "Binário não encontrado após compilação LLVM (procurei $EXE[.exe])."; exit 1; }
    info "Executando binário..."
    if [[ -x "$EXE" ]]; then "$EXE"; else "$EXE.exe"; fi
    ;;
  *)
    fail "Alvo inválido: $ALVO (use bytecode ou llvm)"; exit 1;;
esac
