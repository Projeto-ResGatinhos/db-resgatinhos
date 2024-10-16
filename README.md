# Projeto ResGatinhos

![Logo do Projeto](./assets/images/logo-resgatinhos-de-sao-francisco.jpg)

## Descrição do Projeto

O projeto *ResGatinhos* é uma aplicação desenvolvida para auxiliar na criação e organização do banco de dados da ONG ResGatinhos. Ele permite estruturar informações essenciais relacionadas aos processos e ao estoque da ONG, facilitando a geração de relatórios importantes. O objetivo é fornecer uma solução clara e objetiva para ajudar os voluntários a gerenciarem os dados de maneira eficiente.

---

## Índice

- [Descrição do Projeto](#descrição-do-projeto)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Como Usar](#como-usar)
- [Como Contribuir](#como-contribuir)
- [Colaboradores](#colaboradores)

---

## Estrutura do Projeto

```bash
db-resgatinhos/
├── assets/                     # Arquivos de mídia do projeto
│   ├── imagens/                # Imagens utilizadas no projeto
│   │   └── logo-resgatinhos-de-sao-francisco.jpg # Logo do projeto
│
├── docs/                       # Documentação do banco de dados
│   ├── modelo-conceitual.drawio # Arquivo Draw.io do modelo conceitual
│   ├── modelo-logico.drawio    # Arquivo Draw.io do modelo lógico
│   └── modelo-fisico.sql       # Scripts do modelo físico (com Oracle)
│
├── scripts/                    # (opcional) Scripts automatizados (se necessário)
│   └── create_db.sh            # Script para automatizar criação do banco
│
├── src/                        # Scripts de manipulação do banco
│   ├── insert_data.sql         # Script de inserção de dados
│   ├── update_data.sql         # Script de atualização de dados
│   ├── delete_data.sql         # Script de remoção de dados
│
├── .gitignore                  # Arquivos a serem ignorados pelo Git
└── README.md                   # README geral explicando o projeto
```

## Modelos do Banco de Dados

### Modelo Conceitual

O **modelo conceitual** pode ser encontrado no arquivo `docs/modelo-conceitual.drawio`. Ele descreve de maneira simplificada as principais entidades e seus relacionamentos, servindo como uma visão geral do sistema.

### Modelo Lógico

O **modelo lógico** está no arquivo `docs/modelo-logico.drawio`. Ele especifica as tabelas, colunas, tipos de dados e relações entre as tabelas de maneira detalhada, sendo a base para o desenvolvimento do modelo físico.

### Modelo Físico

O **modelo físico** está no arquivo `docs/modelo-fisico.sql`. Este script contém a criação de tabelas, índices, relacionamentos e outros elementos necessários para implementar o banco de dados no Oracle.

## Como Usar

Para utilizar este projeto, siga as etapas abaixo:

### 1. Clonar o repositório

```bash
git clone https://github.com/Projeto-ResGatinhos/db-resgatinhos.git
```

### 2. Instalar Extensões

Instale as seguintes extensões no VS Code para trabalhar com este projeto:

- [Oracle Developer Tools for VS Code (SQL and PLSQL)](https://marketplace.visualstudio.com/items?itemName=Oracle.oracledevtools)
- [Draw.io Integration](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)

## Como Contribuir

Contribuições são bem-vindas! Para contribuir com o projeto, siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma branch para sua nova feature ou correção: `git checkout -b nome-da-feature`
3. Faça suas alterações e commit no padrão [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/): `git commit -m "feat(db): create users table"`
4. Envie sua branch para o repositório remoto: `git push origin nome-da-feature`
5. Abra um pull request.