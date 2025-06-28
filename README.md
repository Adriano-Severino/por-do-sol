# 🌅 Linguagem de Programação - Por do Sol

Este é o repositório principal da linguagem de programação **Por do Sol** - uma linguagem moderna e educacional escrita inteiramente em português brasileiro. Este projeto reúne todos os componentes necessários para o desenvolvimento completo: compilador, interpretador, ferramentas CLI, framework web, biblioteca padrão e extensões para editores.

## 📖 Sobre a Linguagem

A linguagem **Por do Sol** foi desenvolvida com foco acadêmico e educacional, visando democratizar o ensino de programação no Brasil através de uma sintaxe completamente em português. Ela combina paradigmas modernos de programação com performance nativa através da geração de código LLVM.

### 🎯 Objetivos Principais

- **Educacional**: Facilitar o aprendizado de programação para falantes nativos de português
- **Moderno**: Incorporar conceitos avançados como ownership, orientação a objetos e programação funcional
- **Performático**: Compilação nativa com otimizações LLVM para alta performance
- **Completo**: Ecossistema robusto com ferramentas de desenvolvimento profissionais

### 🚀 Recursos Principais

- ✅ **Sintaxe em Português**: Palavras-chave e conceitos em português brasileiro
- ✅ **Orientação a Objetos**: Classes, herança, encapsulamento e polimorfismo
- ✅ **Sistema de Ownership**: Gerenciamento seguro de memória inspirado no Rust
- ✅ **Interpolação de Strings**: Suporte a `$"Olá {nome}, você tem {idade} anos"`
- ✅ **Namespaces**: Organização modular do código
- ✅ **Construtores Avançados**: Parâmetros padrão estilo C#
- ✅ **Inferência de Tipos**: Declaração com `var` para tipos automáticos
- ✅ **Compilação LLVM**: Performance otimizada e multiplataforma
- ✅ **Framework Web**: Desenvolvimento de APIs e aplicações web
- ✅ **Biblioteca Padrão**: Sistema completo de módulos e utilitários

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter os seguintes softwares instalados:

### Windows
- **Rust (versão 1.70+)**: [Instalar Rust](https://rustup.rs/)
- **Visual Studio Code**: [Download VS Code](https://code.visualstudio.com/)
- **Node.js (18+)**: Para o Language Server Protocol

### Linux/macOS
```bash
# Instalar Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Ubuntu/Debian - Instalar LLVM 16
sudo apt update
sudo apt install llvm-16 llvm-16-dev clang-16

# Node.js para LSP
sudo apt install nodejs npm
```

## ⚙️ Instalação e Configuração Rápida

### 1. Clone o Repositório
```bash
git clone https://github.com/Adriano-Severino/por-do-sol.git
cd por-do-sol
```

### 2. Configuração Inicial Automática
```bash
# Windows (PowerShell)
.\configurar-ambiente.ps1

# Linux/macOS
./configurar-ambiente.sh
```

### 3. Verificação da Instalação
```bash
# Teste rápido do compilador
cd compilador-portugues
cargo test

# Compilar exemplo básico
cargo run -- testes/exemplo_basico.pr
```

## 🏗️ Projetos e Componentes

Este repositório contém múltiplos projetos que formam o ecossistema completo da linguagem Por do Sol:

```text
por-do-sol/
├── 🔧 compilador-portugues/     # Compilador principal e interpretador
├── ⚡ ferramentas-cli/          # CLI para gerenciamento de projetos
├── 🌐 net-por-do-sol/           # Framework web moderno
├── 🧩 pordosol-language-server/ # Extensão VS Code com LSP
├── 📚 sistema-padrao/           # Biblioteca padrão da linguagem
├── 📋 LICENSE                   # Licença MIT
└── 📖 README.md                 # Este arquivo
```

---

## 🔧 1. Compilador Portugues

**Localização**: `./compilador-portugues/`
**Linguagem**: Rust
**Descrição**: O núcleo da linguagem Por do Sol - compilador e interpretador com múltiplos backends.

### Funcionalidades
- Compilador principal com geração de código LLVM
- Interpretador para desenvolvimento e testes rápidos
- Suporte a múltiplos targets (Windows, Linux, macOS)
- Análise estática e otimizações avançadas

### Como Executar
```bash
cd compilador-portugues

# Compilar o projeto
cargo build --release

# Executar compilador
cargo run --bin compilador -- arquivo.pr

# Executar interpretador
cargo run --bin interpretador -- arquivo.pr

# Executar testes
cargo test

# Compilação rápida para desenvolvimento
./compile_fast.sh  # Linux/macOS
.\compile_fast.ps1 # Windows
```

### Exemplos de Uso
```bash
# Compilar um programa Por do Sol
./target/release/compilador exemplo.pr -o programa

# Executar no interpretador
./target/release/interpretador exemplo.pr

# Compilar com otimizações
./target/release/compilador exemplo.pr --optimize -o programa_otimizado
```

---

## ⚡ 2. Ferramentas CLI

**Localização**: `./ferramentas-cli/`
**Linguagem**: Rust
**Descrição**: Conjunto de ferramentas de linha de comando para gerenciamento de projetos Por do Sol.

### Funcionalidades
- `novo`: Criar novos projetos com templates
- `construir`: Build de projetos
- `executar`: Executar projetos
- `pacote`: Gerenciamento de pacotes
- `servir`: Servidor de desenvolvimento

### Como Executar
```bash
cd ferramentas-cli

# Compilar as ferramentas
cargo build --release

# Criar novo projeto
./target/release/ferramentas-cli novo meu_projeto

# Construir projeto
./target/release/ferramentas-cli construir

# Executar projeto
./target/release/ferramentas-cli executar

# Iniciar servidor de desenvolvimento
./target/release/ferramentas-cli servir --porta 3000

# Gerenciar pacotes
./target/release/ferramentas-cli pacote instalar nome_do_pacote
```

### Comandos Disponíveis
```bash
# Ajuda geral
ferramentas-cli --ajuda

# Criar projeto web
ferramentas-cli novo --tipo web minha_api

# Criar projeto desktop
ferramentas-cli novo --tipo desktop meu_app

# Build em modo release
ferramentas-cli construir --release

# Executar com argumentos
ferramentas-cli executar -- --argumento valor
```

---

## 🌐 3. Net Por do Sol (Framework Web)

**Localização**: `./net-por-do-sol/`
**Linguagem**: Por do Sol
**Descrição**: Framework web moderno inspirado no ASP.NET Core, adaptado para a linguagem Por do Sol.

### Funcionalidades
- Sistema de rotas avançado
- Middleware pipeline
- Injeção de dependências
- Controladores MVC
- Suporte a APIs REST
- Contexto HTTP completo

### Estrutura do Framework
```text
net-por-do-sol/
├── src/
│   ├── nucleo/               # Core do framework
│   │   ├── aplicacao.pr      # Aplicação web principal
│   │   ├── servidor.pr       # Servidor HTTP
│   │   ├── middleware.pr     # Pipeline de middleware
│   │   └── rota.pr           # Sistema de rotas
│   ├── controladores/        # Controladores base
│   │   ├── controlador_base.pr
│   │   └── api_controlador.pr
│   ├── http/                 # Abstrações HTTP
│   │   ├── requisicao.pr     # HttpRequest
│   │   ├── resposta.pr       # HttpResponse
│   │   └── contexto.pr       # HttpContext
│   └── dependencias/         # Injeção de dependências
│       ├── container.pr
│       └── servicos.pr
```

### Como Usar
```por-do-sol
// Exemplo de API simples
usando Net.PorDoSol;
usando Net.PorDoSol.Controladores;

publico classe MinhaAPI : ApiControlador
{
    publico funcao obter_usuarios() : Lista<Usuario>
    {
        retornar usuarios_servico.obter_todos();
    }
    
    publico funcao criar_usuario(usuario: Usuario) : RespstaHTTP
    {
        usuarios_servico.criar(usuario);
        retornar Ok("Usuário criado com sucesso");
    }
}

// Configuração da aplicação
funcao principal()
{
    var app = Aplicacao.criar();
    
    app.usar_rota("/api/usuarios", MinhaAPI);
    app.usar_middleware(autenticacao_middleware);
    
    app.executar("localhost:5000");
}
```

### Como Executar
```bash
cd net-por-do-sol

# Como este é escrito em Por do Sol, use o compilador
cd ../compilador-portugues
cargo run -- ../net-por-do-sol/exemplos/api_exemplo.pr

# Ou use as ferramentas CLI
cd ../ferramentas-cli
cargo run -- servir ../net-por-do-sol/
```

---

## 🧩 4. Por do Sol Language Server (Extensão VS Code)

**Localização**: `./pordosol-language-server/`
**Linguagem**: TypeScript
**Descrição**: Extensão completa do VS Code com Language Server Protocol para desenvolvimento em Por do Sol.

### Funcionalidades
- **Syntax Highlighting**: Realce de sintaxe completo
- **LSP**: Language Server Protocol com autocompletar
- **Hover**: Informações de tipos e documentação
- **Diagnósticos**: Validação em tempo real
- **Snippets**: Modelos de código predefinidos
- **Code Folding**: Dobrar blocos de código
- **Análise de Ownership**: Validação de empréstimos e referências

### Como Instalar e Executar
```bash
cd pordosol-language-server

# Instalar dependências
npm install

# Compilar a extensão
npm run compile

# Desenvolver (modo watch)
npm run watch

# Gerar pacote VSIX
npm run package

# Instalar a extensão no VS Code
code --install-extension pordosol-language-server-2.0.0.vsix
```

### Desenvolvimento da Extensão
```bash
# Abrir no VS Code para desenvolvimento
code .

# Pressionar F5 para abrir janela de desenvolvimento
# A extensão será carregada automaticamente

# Abrir um arquivo .pr para testar
# Os recursos LSP estarão disponíveis
```

### Recursos Disponíveis
- **Arquivos suportados**: `.pr`, `.pds`
- **Autocompletar**: Classes, funções, variáveis
- **Validação**: Erros de sintaxe e tipos
- **Hover**: Documentação inline
- **Snippets**: `classe`, `função`, `espaco`, `main`

---

## 📚 5. Sistema Padrão (Biblioteca Padrão)

**Localização**: `./sistema-padrao/`
**Linguagem**: Por do Sol
**Descrição**: Biblioteca padrão completa da linguagem, similar ao System do .NET.

### Módulos Disponíveis

#### 📁 Coleções (`sistema.colecoes`)
- `lista.pr`: Listas dinâmicas
- `dicionario.pr`: Mapas chave-valor
- `fila.pr`: Estruturas FIFO/LIFO

#### 📁 I/O (`sistema.io`)
- `arquivo.pr`: Manipulação de arquivos
- `diretorio.pr`: Operações de diretório
- `leitor.pr`: Leitura de streams

#### 📁 Rede (`sistema.rede`)
- `http.pr`: Cliente HTTP
- `socket.pr`: Sockets TCP/UDP
- `dns.pr`: Resolução DNS

#### 📁 Texto (`sistema.texto`)
- `codificacao.pr`: UTF-8, ASCII, etc.
- `regex.pr`: Expressões regulares
- `json.pr`: Serialização JSON

#### 📁 Data (`sistema.data`)
- `data.pr`: Manipulação de datas
- `horario.pr`: Operações de tempo

#### 📁 Threading (`sistema.threading`)
- `tarefa.pr`: Tarefas assíncronas
- `mutex.pr`: Sincronização

### Como Usar
```por-do-sol
// Importar módulos do sistema
usando Sistema.Colecoes;
usando Sistema.IO;
usando Sistema.Rede;

funcao exemplo_sistema()
{
    // Usar lista
    var lista = Lista<texto>.criar();
    lista.adicionar("item 1");
    lista.adicionar("item 2");
    
    // Ler arquivo
    var conteudo = Arquivo.ler_texto("arquivo.txt");
    
    // Fazer requisição HTTP
    var resposta = HTTP.obter("https://api.exemplo.com/dados");
    
    // Trabalhar com JSON
    var dados = JSON.deserializar<Usuario>(resposta.corpo);
}
```

### Como Construir
```bash
cd sistema-padrao

# Construir biblioteca
./construir.sh  # Linux/macOS
.\construir.ps1 # Windows

# Ou usar script de desenvolvimento
./desenvolvimento.sh

# Instalar ferramentas auxiliares
./ferramentas/instalar.sh
```

### Configuração (Sistema.toml)
```toml
[biblioteca]
nome = "Sistema"
versao = "1.0.0"
descricao = "Biblioteca padrão da linguagem portuguesa"
autor = "Adriano Severino"

[modulos]
io = ["arquivo", "diretorio", "leitor"]
colecoes = ["lista", "dicionario", "fila"]
rede = ["http", "socket"]
texto = ["json", "regex"]
data = ["data", "horario"]
```

## 🤝 Contribuindo

Contribuições são muito bem-vindas! Para contribuir:

1. Faça um fork do repositório
2. Clone sua fork:
    ```bash
    git clone https://github.com/Adriano-Severino/por-do-sol.git
    ```
3. Crie uma branch para sua feature:
    ```bash
    git checkout -b minha-nova-feature
    ```
4. Faça suas mudanças e adicione testes, se aplicável.
5. Faça um commit das suas mudanças:
    ```bash
    git commit -m "Adiciona nova feature incrível"
    ```
6. Faça um push para sua fork:
    ```bash
    git push origin minha-nova-feature
    ```
7. Abra um Pull Request no repositório original.

## Diretrizes para Contribuição

- Mantenha a sintaxe da linguagem e dos comentários em português brasileiro.
- Adicione testes para novas funcionalidades ou correções de bugs.
- Documente quaisquer mudanças significativas no README.md ou em comentários no código.
- Siga o estilo de código existente.

## 🐛 Reportando Problemas

Encontrou um bug ou tem alguma sugestão? Abra uma Issue [neste link](https://github.com/Adriano-Severino/por-do-sol) com:

1. Descrição detalhada do problema ou sugestão.
2. Passos para reproduzir o erro (se for um bug).
3. Informações do seu ambiente de desenvolvimento (versão do Rust, sistema operacional, etc).
4. Se possível, forneça um exemplo de código que reproduz o problema.
5. Saída esperada vs. saída atual.

## 📝 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

---

## 💡 Exemplos Práticos de Código

### Programa "Olá Mundo" Simples
```por-do-sol
inicio
    escreva("Olá, Mundo!");
fim
```

### Exemplo com Classes e Herança
```por-do-sol
espaco MeuPrograma.Modelos
{
    publico classe Pessoa
    {
        publico texto Nome { obter; definir; }
        publico inteiro Idade { obter; definir; }
        
        publico Pessoa(texto nome, inteiro idade = 18)
        {
            Nome = nome;
            Idade = idade;
        }
        
        publico virtual vazio apresentar()
        {
            imprima($"Olá, eu sou {Nome} e tenho {Idade} anos.");
        }
    }
    
    publico classe Desenvolvedor : Pessoa
    {
        publico texto Linguagem { obter; definir; }
        
        publico Desenvolvedor(texto nome, texto linguagem, inteiro idade = 25) 
            : base(nome, idade)
        {
            Linguagem = linguagem;
        }
        
        publico override vazio apresentar()
        {
            base.apresentar();
            imprima($"Eu programo em {Linguagem}!");
        }
    }
}

funcao principal()
{
    usando MeuPrograma.Modelos;
    
    var pessoa = novo Pessoa("Maria");
    var dev = novo Desenvolvedor("João", "Por do Sol", 30);
    
    pessoa.apresentar();
    dev.apresentar();
}
```

### Exemplo de API Web
```por-do-sol
usando Net.PorDoSol;
usando Sistema.Colecoes;
usando Sistema.Texto;

publico classe UsuariosControlador : ApiControlador
{
    privado Lista<Usuario> usuarios;
    
    publico UsuariosControlador()
    {
        usuarios = Lista<Usuario>.criar();
        usuarios.adicionar(novo Usuario("João", "joao@email.com"));
        usuarios.adicionar(novo Usuario("Maria", "maria@email.com"));
    }
    
    [Rota("/usuarios", Metodo.GET)]
    publico funcao obter_todos() : Lista<Usuario>
    {
        retornar usuarios;
    }
    
    [Rota("/usuarios/{id}", Metodo.GET)]
    publico funcao obter_por_id(inteiro id) : Usuario
    {
        se (id < usuarios.tamanho())
            retornar usuarios[id];
        senao
            lancar novo ExcecaoNaoEncontrado("Usuário não encontrado");
    }
    
    [Rota("/usuarios", Metodo.POST)]
    publico funcao criar([DoCorpo] Usuario usuario) : RespostaHTTP
    {
        usuarios.adicionar(usuario);
        retornar Criado($"/usuarios/{usuarios.tamanho() - 1}", usuario);
    }
}

funcao principal()
{
    var app = Aplicacao.criar();
    
    app.configurar_servicos(servicos => {
        servicos.adicionar_controladores();
        servicos.adicionar_json();
    });
    
    app.configurar_pipeline(pipeline => {
        pipeline.usar_cors();
        pipeline.usar_roteamento();
        pipeline.usar_controladores();
    });
    
    app.executar("http://localhost:5000");
}
```

---

## 🚀 Guia de Início Rápido

### 1. Instalação Completa
```bash
# 1. Clone o repositório
git clone https://github.com/Adriano-Severino/por-do-sol.git
cd por-do-sol

# 2. Construir o compilador
cd compilador-portugues
cargo build --release

# 3. Construir as ferramentas CLI
cd ../ferramentas-cli
cargo build --release

# 4. Instalar extensão VS Code
cd ../pordosol-language-server
npm install
npm run compile
npm run package
code --install-extension pordosol-language-server-2.0.0.vsix
```

### 2. Criando seu Primeiro Projeto
```bash
# Criar novo projeto
cd ../ferramentas-cli
./target/release/ferramentas-cli novo meu_primeiro_projeto
cd meu_primeiro_projeto

# Editar arquivo principal
code programa.pr
```

### 3. Código do Primeiro Programa
```por-do-sol
// programa.pr
inicio
    inteiro idade = 25;
    texto nome = "Desenvolvedor";
    
    se (idade >= 18) {
        escreva($"Olá {nome}, você é maior de idade!");
    } senao {
        escreva($"Olá {nome}, você é menor de idade.");
    }
    
    // Loop simples
    para (inteiro i = 1; i <= 5; i++) {
        escreva($"Contando: {i}");
    }
fim
```

### 4. Compilar e Executar
```bash
# Compilar
../ferramentas-cli/target/release/ferramentas-cli construir

# Executar
../ferramentas-cli/target/release/ferramentas-cli executar

# Ou usar o compilador diretamente
../compilador-portugues/target/release/compilador programa.pr -o programa
./programa  # Linux/macOS
program.exe # Windows
```

---

## 🧪 Testes e Qualidade

### Executar Todos os Testes
```bash
# Testar compilador
cd compilador-portugues
cargo test
cargo test --release

# Testar ferramentas CLI
cd ../ferramentas-cli
cargo test

# Testar extensão VS Code
cd ../pordosol-language-server
npm test

# Script de teste completo
cd ..
./testar_todos_projetos.sh  # Linux/macOS
.\testar_todos_projetos.ps1 # Windows
```

### Benchmarks
```bash
cd compilador-portugues

# Executar benchmarks de performance
cargo bench

# Teste de compilação rápida
./compile_fast.sh exemplo_complexo.pr

# Comparação de performance
./benchmark.sh
```

---

## 📚 Referência Completa da Linguagem

### Tipos Primitivos
- `inteiro`: Números inteiros (32-bit)
- `longo`: Números inteiros (64-bit)
- `real`: Números decimais (64-bit)
- `texto`: Strings UTF-8
- `booleano`: Verdadeiro/falso
- `caractere`: Caractere único

### Palavras-chave
```
inicio, fim, se, senao, para, enquanto, fazer, classe,
publico, privado, protegido, estatico, virtual, override,
funcao, retornar, novo, este, base, usando, espaco,
var, const, verdadeiro, falso, nulo
```

### Operadores
- **Aritméticos**: `+`, `-`, `*`, `/`, `%`
- **Comparação**: `==`, `!=`, `<`, `>`, `<=`, `>=`
- **Lógicos**: `&&`, `||`, `!`
- **Atribuição**: `=`, `+=`, `-=`, `*=`, `/=`
- **Incremento**: `++`, `--`

---

## 🔧 Configuração de Desenvolvimento

### Configurar VS Code
```json
// .vscode/settings.json
{
    "files.associations": {
        "*.pr": "pordosol",
        "*.pds": "pordosol"
    },
    "pordosolLanguageServer.enableStrictMode": true,
    "pordosolLanguageServer.enableOwnershipAnalysis": true,
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "adriano-severino.pordosol-language-server"
}
```

### Configurar Tasks
```json
// .vscode/tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Compilar Por do Sol",
            "type": "shell",
            "command": "../compilador-portugues/target/release/compilador",
            "args": ["${file}", "-o", "${fileDirname}/${fileBasenameNoExtension}"]
        },
        {
            "label": "Executar Por do Sol",
            "type": "shell",
            "command": "../compilador-portugues/target/release/interpretador",
            "args": ["${file}"]
        }
    ]
}
```

---

## 🌟 Roadmap e Próximas Funcionalidades

### Versão 1.1 (Em Desenvolvimento)
- [ ] **Generics**: Suporte completo a tipos genéricos
- [ ] **Async/Await**: Programação assíncrona nativa
- [ ] **Pattern Matching**: Correspondência de padrões
- [ ] **Package Manager**: Gerenciador de pacotes integrado
- [ ] **WASM Backend**: Compilação para WebAssembly

### Versão 1.2 (Planejado)
- [ ] **GUI Framework**: Framework para interfaces gráficas
- [ ] **Database ORM**: Mapeamento objeto-relacional
- [ ] **Mobile Support**: Desenvolvimento mobile
- [ ] **Cloud Integration**: Integração com serviços em nuvem
- [ ] **Hot Reload**: Recarregamento automático durante desenvolvimento

### Versão 2.0 (Futuro)
- [ ] **AI Integration**: Integração com IA e Machine Learning
- [ ] **Blockchain Support**: Desenvolvimento de contratos inteligentes
- [ ] **IoT Framework**: Suporte para Internet das Coisas
- [ ] **Game Engine**: Motor de jogos integrado

---

## 🏆 Agradecimentos

- À **comunidade Rust** por suas ferramentas e ecossistema incríveis
- Ao projeto **LLVM** por fornecer uma infraestrutura de compilação robusta e poderosa
- À **comunidade TypeScript/VS Code** por facilitar o desenvolvimento de extensões
- Aos **educadores e estudantes brasileiros** que inspiram e podem se beneficiar deste projeto
- A todos os **contribuidores** que ajudam a tornar este projeto melhor

---

## 📞 Contato e Comunidade

- **GitHub**: [Adriano-Severino](https://github.com/Adriano-Severino)
- **Issues**: [Reportar Bugs](https://github.com/Adriano-Severino/por-do-sol/issues)
- **Discussions**: [Discussões da Comunidade](https://github.com/Adriano-Severino/por-do-sol/discussions)
- **Wiki**: [Documentação Completa](https://github.com/Adriano-Severino/por-do-sol/wiki)

---

⭐ **Se este projeto foi útil, deixe uma estrela!**

🌟 **Ajude a democratizar a programação em português!**

🚀 **Faça parte da revolução da programação em português brasileiro!**
