class Emprestimo

	def initialize(db)
		@db = db
		@livro_devolvido = 0
	end

	def realizar_emprestimo
		puts "Digite o cpf do emprestimo que receberá o livro:"
		cpf = gets.chomp

		puts "Digite o titulo do livro:"
		livro = gets.chomp


		puts "Digite a data do emprestimo(dd/mm/year):"
		emprestimo_inicio = gets.chomp

		puts "Digite a data do fim do emprestimo(dd/mm/year):"
		emprestimo_fim = gets.chomp

	    if  cpf.gsub(/\D/, '').length == 11 
			livro2 = @db.execute("SELECT id FROM livros WHERE titulo = ?", [livro])
			cpf2 = @db.execute("SELECT id FROM usuarios WHERE cpf = ?", [cpf])
			@db.execute("INSERT INTO emprestimos (livro_id, usuario_id, data_emprestimo, data_devolucao, livro_devolvido) VALUES (?, ?, ?, ?, ?)", [livro2, cpf2, emprestimo_inicio, emprestimo_fim, @livro_devolvido])
		else
			puts "cpf invalido"
		end
	end

	def mostrar_emprestimos
	  @db.results_as_hash = true
	  emprestimo = @db.execute("SELECT * FROM emprestimos")
	  
	  emprestimo.each do |linha|
	    titulo = @db.execute("SELECT titulo FROM livros WHERE id = ?", [linha['livro_id']])[0]['titulo']
	    usuario = @db.execute("SELECT nome FROM usuarios WHERE id = ?", [linha['usuario_id']])[0]['nome']
	    livro_devolvido = linha['livro_devolvido'] == 0 ? "livro não devolvido" : "livro devolvido"
	    
	    puts "ID: #{linha['id']} | Título do livro: #{titulo} | Usuário: #{usuario} | Data de empréstimo: #{linha['data_emprestimo']} | " \
	         "Data de devolução: #{linha['data_devolucao']} | Livro devolvido: #{livro_devolvido} \n"
	  end
	end


	def finalizar_emprestimo
		puts "digite o ID do emprestimo: "
		id = gets.chomp

		@db.execute("UPDATE emprestimos SET livro_devolvido = ? WHERE id = ?", [1, id])	

		puts "Emprestimo finalizado!"
	end


	def menu_emprestimo
		menu_rodando = true
		opcao = 0
		while menu_rodando
		puts "Escolha uma das opções
	1.Mostrar emprestimos 
	2.Realizar emprestimo 
	3.Registrar devolucao
	4.Sair
			"	
			    opcao = gets.chomp.to_i # .chomp remove a quebra de linha
				case opcao
				when 1
					mostrar_emprestimos			
				when 2 
					realizar_emprestimo
				when 3   
					finalizar_emprestimo
				when 4 
					break
				end

		end
	end 
end