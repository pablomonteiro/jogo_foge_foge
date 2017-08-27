require_relative "util"
require_relative "business_colisao"
require_relative "business_monstro"


def encontra_jogador mapa
	mapa.each_with_index do | linha_atual, linha |
		posicao_jogador = linha_atual.index icone_jogador
		if posicao_jogador
			return [linha, posicao_jogador]
		end
	end
end



def posiciona_jogador jogador, mapa, icone
	linha = jogador[0]
	coluna = jogador[1]
	mapa[linha][coluna] = icone
end



def movimenta_jogador jogador, jogada, mapa

	jogador_posicao_atual = jogador.dup

	movimentos = {
		"W" => [-1, 0],
		"A" => [0, -1],
		"D" => [0, 1],
		"S" => [1, 0]
	}
	movimento = movimentos[jogada]
	jogador[0] += movimento[0]
	jogador[1] += movimento[1]

	if colisao_barreira? jogador, mapa
		return jogador_posicao_atual, false
	end

	monstros = posicoes_monstros mapa

	if colisao_monstros? jogador, monstros, mapa
		return jogador, true
	end 
	
	posiciona_jogador jogador_posicao_atual, mapa, icone_vazio
	posiciona_jogador jogador, mapa, icone_jogador

	return jogador, false
end
