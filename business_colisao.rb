def colisao_barreira? personagem, mapa
	return colisao? personagem, mapa, icone_barreira
end



def colisao_monstro? personagem, mapa
	return colisao? personagem, mapa, icone_monstro
end



def colisao_monstros? personagem, monstros, mapa

	linha_personagem = personagem[0]
	coluna_personagem = personagem[1]

	monstros.each do |monstro|
		linha_monstro = monstro[0]
		coluna_monstro = monstro[1]
		mesma_posicao = (linha_personagem == linha_monstro && coluna_personagem == coluna_monstro)

		if mesma_posicao
			return true
		end
	end

	return false
end



def colisao? personagem, mapa, icone
	linha = personagem[0]
	coluna = personagem[1]

	if fora_limite_mapa? mapa, linha, coluna
		return true
	end

	if mapa[linha][coluna] == icone
		return true
	end

	return false
end



def fora_limite_mapa? mapa, linha, coluna
	qtde_linhas_mapa = mapa.size
	if qtde_linhas_mapa <= linha || linha < 0
		return true
	end

	qtde_colunas_mapa = mapa[linha].size
	if qtde_colunas_mapa <= coluna || coluna < 0
		return true
	end
	return false
end