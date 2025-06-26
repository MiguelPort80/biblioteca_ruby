class Usuario
	
	def initialize(db)
		@db = db
	end

	def adicionar_usuario
	    puts "Digite o nome do usuario:"
	    nome = gets.chomp

	    puts "Digite o cpf do usuario (somente números):"
	    cpf = gets.chomp

	    puts "digite o número de telefone:"
	    telefone = gets.chomp

	    if  cpf.gsub(/\D/, '').length == 11 && telefone.gsub(/\D/, '').length == 11
			@db.execute("INSERT INTO usuarios (nome, telefone, cpf) VALUES (?, ?, ?)", [nome, telefone, cpf])
			puts "usuario '#{nome}' adicionado com sucesso! \n"

		else
			puts "telefone ou cpf invalidos"
	    end
	end

	def mostrar_usuarios
		puts "\nLista de usuários:"
		usuarios.each do |linha|
		  puts "ID: #{linha[0]} | Nome: #{linha[1]} | Telefone: #{linha[2]} | CPF: #{linha[3]}"
		end

	end



	def remover_usuario
		puts "digite o nome do usuario: "
		nome = gets.chomp
		puts "digite o cpf do usuario (somente números): "
		cpf = gets.chomp

		@db.execute("DELETE FROM usuarios WHERE nome = ? AND cpf = ?", [nome, cpf])	

		puts "o usuario #{nome} foi deletado com sucesso"
	end


	def menu_usuario
		menu_rodando = true
		opcao = 0
		while menu_rodando
		puts "Escolha uma das opções
	1.Mostrar usuarios 
	2.Adicionar usuario
	3.Deletar usuario 
	4.Sair
			"	
			    opcao = gets.chomp.to_i # .chomp remove a quebra de linha
				case opcao
				when 1
					mostrar_usuarios			
				when 2 
					adicionar_usuario
				when 3   
					remover_usuario
				when 4 
					break
				end

		end
	end 

end
