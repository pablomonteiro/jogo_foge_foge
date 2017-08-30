class Jogador

	attr_accessor :linha, :coluna


	def to_array
		[linha, coluna]
	end


	def icone_jogador
		"H"
	end


	def remove_do mapa
		mapa[linha][coluna] = " "
	end


	def posicione_no mapa
		mapa[linha][coluna] = icone_jogador
	end

end