# compilar-portugues

Este é o compilador para a linguagem de programação Português.

## Objetivo do Projeto

O objetivo deste projeto é desenvolver uma linguagem de programação com sintaxe em português, baseada na funcionalidade e nos conceitos da linguagem C#. Isso significa que a linguagem terá equivalentes em português para estruturas e tipos de dados comuns do C# (por exemplo, `Lista` funcionando de forma similar a `List`), mantendo a mesma semântica e comportamento. A principal diferença será a sintaxe em português e a capacidade de compilar para diferentes targets, conforme detalhado abaixo.

## Tecnologias

- Rust
- LLVM


## Targets de Compilação

O projeto suporta diferentes targets de compilação, que geram diferentes tipos de saída ou executáveis. A lógica para cada target é separada em `src/codegen/` para facilitar a manutenção e evitar a mistura de funcionalidades.

## Compilando Múltiplos Arquivos

Para compilar múltiplos arquivos `.pr` que dependem uns dos outros (como `compilador-portugues/exemplos/programa_principal.pr` que usa `compilador-portugues/exemplos/biblioteca.pr`), você pode usar o script `compile_fast_Multiplos_arquivos.sh`.

Este script compila os arquivos fornecidos para bytecode e gera um único arquivo `.pbc` que pode ser executado pelo interpretador.

**Exemplo de uso:**
```bash
./compile_fast_Multiplos_arquivos.sh exemplos/biblioteca.pr exemplos/programa_principal.pr
```

Isso gerará um arquivo `biblioteca.pbc` (baseado no primeiro arquivo passado) que pode ser executado com:
```bash
cargo run --bin interpretador -- biblioteca.pbc
```

## Como Rodar Testes

Para rodar todos os testes:
```bash
cargo test
```

## Estrutura do Projeto

- `compilador-portugues/src/`: Contém o código-fonte do compilador.
- `compilador-portugues/src/codegen/`: Contém a lógica de geração de código para cada target (bytecode, cil, llvm_ir).
- `compilador-portugues/exemplos/`: Contém exemplos de código na linguagem Português.
- `compilador-portugues/target/`: Saída da compilação.

## Exemplos de Código

A pasta `compilador-portugues/exemplos/` contém os seguintes arquivos de exemplo, que podem ser usados para testar o compilador e o interpretador. É importante manter a compatibilidade com esses exemplos ao adicionar novas funcionalidades para evitar quebras:

- `aritmetica.pr`
- `biblioteca_sistema.pr`
- `biblioteca.pr`
- `classes.pr`
- `condicionais.pr`
- `funcao.pr`
- `heranca_simples.pr`
- `heranca.pr`
- `loops.pr`
- `programa_principal.pr`
- `teste_avancado.pr`
- `teste_simples.pr`
- `teste.pr`

## Diretrizes de Desenvolvimento

Ao desenvolver ou fazer manutenção, é crucial manter a lógica de cada target de compilação separada. A pasta `src/codegen/` foi estruturada para isso. Certifique-se de que as alterações em um target não afetem indevidamente outros targets, garantindo a estabilidade e a facilidade de manutenção do projeto.

## Desenvolvimento da Extensão VS Code

Ao trabalhar na extensão do VS Code para a linguagem Português (localizada em `C:/Users/Adria/source/por-do-sol/pordosol-language-server`), siga as seguintes diretrizes para garantir a compatibilidade e a completude:

1.  **Verificar Exemplos Existentes:** Consulte a pasta de exemplos do compilador (`C:/Users/Adria/source/por-do-sol/compilador-portugues/exemplos`) para identificar funcionalidades da linguagem que já estão implementadas e que ainda não foram refletidas na extensão do VS Code.
2.  **Analisar a Sintaxe do Compilador:** Para entender a sintaxe completa suportada pelo compilador e garantir a compatibilidade da extensão, examine os arquivos-chave do compilador na pasta `C:/Users/Adria/source/por-do-sol/compilador-portugues/src`. Em particular, preste atenção a:
    -   `ast.rs`: Define a Abstract Syntax Tree (AST) da linguagem.
    -   `lexer.rs`: Define o analisador léxico (tokenização).
    -   `parser.lalrpop`: Define as regras de análise sintática (parsing).
    -   Outros arquivos relevantes que definam a estrutura e o comportamento da linguagem.

Isso ajudará a garantir que a extensão do VS Code ofereça suporte completo e preciso para a linguagem Português, incluindo realce de sintaxe, autocompletar e outras funcionalidades de IDE.