require_relative "business_colisao"
require_relative "util"

def move_monstro mapa, mapa_novo, num_linha, num_coluna
	posicoes = posicoes_disponiveis_para_movimento mapa, mapa_novo, num_linha, num_coluna
	if posicoes.empty?
		return
	end
	#posicao_selecionada = posicoes[0]
	index = rand(posicoes.size - 1);
	puts posicoes[index]
	posicao_selecionada = posicoes[index]
	#posicao_selecionada = [num_linha, num_coluna + 1]
	mapa_novo[posicao_selecionada[0]][posicao_selecionada[1]] = icone_monstro
	mapa_novo
end


def movimenta_monstro mapa
	mapa_novo = mapa.join("\n").tr(icone_monstro, " ").split("\n")
	mapa.each_with_index do | linha_atual, num_linha |
		caracteres_da_linha = linha_atual.chars
		caracteres_da_linha.each_with_index do |caractere_atual, num_coluna|
			if caractere_atual == icone_monstro
				mapa[num_linha][num_coluna] = " "
				move_monstro mapa, mapa_novo, num_linha, num_coluna
			end
		end
	end
	mapa_novo
end


def posicoes_disponiveis_para_movimento mapa, mapa_novo, num_linha, num_coluna

	posicoes_disponiveis = []

	cima     = [num_linha - 1, num_coluna]
	baixo    = [num_linha + 1, num_coluna]
	esquerda = [num_linha, num_coluna - 1]
	direita  = [num_linha, num_coluna + 1]

	posicoes_validas = [cima, baixo, direita, esquerda];

	posicoes_validas.each do |posicao| 
		if posicao_disponivel?(posicao, mapa) && posicao_disponivel?(posicao, mapa_novo)	
			posicoes_disponiveis << posicao	
		end
	end

	posicoes_disponiveis
end


def posicao_disponivel? posicao, mapa
	!colisao_barreira?(posicao, mapa) && !colisao_monstro?(posicao, mapa)
end


def posicoes_monstros mapa

	monstros = []
	mapa.each_with_index do | linha_atual, num_linha |
		caracteres_da_linha = linha_atual.chars
		caracteres_da_linha.each_with_index do |caractere_atual, num_caractere|
			if caractere_atual == icone_monstro
				monstro = [num_linha, num_caractere]
				monstros << monstro
			end
		end
	end
	monstros

end