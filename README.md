# Sistema de Gerenciamento de Biblioteca

Este projeto é um sistema de gerenciamento de biblioteca desenvolvido em Ruby, que permite gerenciar livros, usuários e empréstimos de forma simples e eficiente.

## Índice

- [Sobre](#sobre)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Instalação](#instalação)
- [Uso](#uso)
- [Estrutura do Banco de Dados](#estrutura-do-banco-de-dados)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Sobre

O sistema permite que os usuários acessem informações sobre livros, gerenciem usuários e registrem empréstimos de livros. Ele utiliza um banco de dados SQLite para armazenar as informações.

## Tecnologias Utilizadas

- Ruby
- SQLite3

## Instalação

Para executar este projeto, você precisará ter o Ruby e o SQLite3 instalados em sua máquina. Siga os passos abaixo:

1. Clone o repositório:
   ```bash
   git clone https://github.com/usuario/nome-do-repositorio.git
   
2. Navegue até o diretório do projeto:

bash

cd nome-do-repositorio

Instale a gem SQLite3, se ainda não estiver instalada:

bash

    gem install sqlite3

Uso

Para iniciar o sistema, execute o seguinte comando no terminal:

bash

ruby nome_do_arquivo.rb

Substitua nome_do_arquivo.rb pelo nome do arquivo que contém o código principal.
Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas:

    livros: Armazena informações sobre os livros.
        id: Identificador único do livro.
        titulo: Título do livro.
        autor: Autor do livro.
        ano: Ano de publicação.

    usuarios: Armazena informações sobre os usuários.
        id: Identificador único do usuário.
        nome: Nome do usuário.
        telefone: Telefone do usuário.
        cpf: CPF do usuário.

    emprestimos: Armazena informações sobre os empréstimos de livros.
        id: Identificador único do empréstimo.
        livro_id: ID do livro emprestado.
        usuario_id: ID do usuário que fez o empréstimo.
        data_emprestimo: Data em que o livro foi emprestado.
        data_devolucao: Data em que o livro deve ser devolvido.
        livro_devolvido: Indica se o livro foi devolvido.

Contribuição

Se você deseja contribuir para este projeto, siga os passos abaixo:

    Faça um fork do repositório.
    Crie uma nova branch (git checkout -b feature/nova-funcionalidade).
    Faça suas alterações e commit (git commit -m 'Adiciona nova funcionalidade').
    Envie para o repositório remoto (git push origin feature/nova-funcionalidade).
    Abra um Pull Request.

Licença

Este projeto está sem nenhum tipo de licença

Code


### Personalização

- **Nome do Repositório**: Substitua `usuario/nome-do-repositorio` pela URL real do seu repositório.
- **Nome do Arquivo**: Substitua `nome_do_arquivo.rb` pelo nome do arquivo que contém o código principal do seu projeto.
- **Licença**: Se você estiver usando uma licença diferente, atualize a seção de licença conforme necessário.

Depois de personalizar o conteúdo, salve o arquivo como `README.md` na raiz do seu projeto. Isso ajudará outros a ente
