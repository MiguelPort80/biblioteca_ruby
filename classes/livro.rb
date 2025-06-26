class Livro
	def initialize(db)
		@db = db
	end

	def adicionar_livro
	    puts "Digite o título do livro:"
	    titulo = gets.chomp

	    puts "digite o autor:"
	    autor = gets.chomp

	    puts "digite o ano de publicação:"
	    ano = gets.chomp
	    if titulo.strip.empty? || autor.strip.empty? || ano.strip.empty?
		  puts "Todos os campos são obrigatórios."
		  return
		end
		titulo = titulo
		autor = autor
		ano = ano
		@db.execute("INSERT INTO livros (titulo, autor, ano) VALUES (?, ?, ?)", [@titulo, @autor, @ano])
		puts "Livro '#{@titulo}' adicionado com sucesso! \n"
	end

	def mostrar_livros
		livros = @db.execute("select * from livros")
	    livros.each { |linha| puts "ID: #{livro['id']} | Título: #{livro['titulo']} | Autor: #{livro['autor']} | Ano: #{livro['ano']}" } 
	end



	def remover_livro
		puts "digite o nome do livro"
		titulo = gets.chomp

	    puts "digite o autor:"
	    autor = gets.chomp

		@db.execute("DELETE FROM livros WHERE titulo = ? AND autor = ?", [titulo, autor])	

		puts "o livro #{titulo} foi deletado com sucesso"
	end


	def menu_livro
		menu_rodando = true
		opcao = 0
		while menu_rodando
		puts "Escolha uma das opções
	1.Mostrar livros 
	2.Adicionar livro
	3.Deletar livro 
	4.Sair
			"	
			    opcao = gets.chomp.to_i # .chomp remove a quebra de linha
				case opcao
				when 1
					mostrar_livros			
				when 2 
					adicionar_livro
				when 3   
					remover_livro
				when 4 
					break
				end

		end
	end 

end
