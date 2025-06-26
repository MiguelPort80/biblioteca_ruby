require 'sqlite3'
require_relative 'classes/livro'
require_relative 'classes/usuario'
require_relative 'classes/emprestimo'

DB = SQLite3::Database.open("biblioteca.db")

def inicializacao

  #cria as tabelas caso elas já não tenham sido criadas.
  DB.execute <<-SQL
    CREATE TABLE IF NOT EXISTS livros (
      id INTEGER PRIMARY KEY,
      titulo TEXT,
      autor TEXT,
      ano INTEGER
    );
  SQL

  DB.execute <<-SQL
    CREATE TABLE IF NOT EXISTS usuarios (
      id INTEGER PRIMARY KEY,
      nome TEXT,
      telefone TEXT,
      cpf TEXT
    );
  SQL

  DB.execute <<-SQL
    CREATE TABLE IF NOT EXISTS emprestimos (
      id INTEGER PRIMARY KEY,
      livro_id INTEGER,
      usuario_id INTEGER,
      data_emprestimo TEXT,
      data_devolucao TEXT,
      livro_devolvido BOOLEAN,
      FOREIGN KEY (livro_id) REFERENCES livros(id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    );
  SQL

end

def menu
  menu_rodando = true
  opcao = 0
  while menu_rodando
    puts "Escolha uma das opções
      1.Acessar usuarios
      2.Acessar livros
      3.Acessar empréstimos
      4.Sair
    "

    opcao = gets.chomp.to_i # .chomp remove a quebra de linha
    case opcao
    when 1
      usuario = Usuario.new(DB)
      usuario.menu_usuario
    when 2
      livro = Livro.new(DB)
      livro.menu_livro
    when 3
      emprestimo = Emprestimo.new(DB)
      emprestimo.menu_emprestimo
    when 4 
      break
    end


  end
end

inicializacao
menu