require_relative "util"
require_relative "business_colisao"
require_relative "business_monstro"
require_relative "jogador"


def encontra_jogador mapa
	mapa.each_with_index do | linha_atual, linha |
		posicao_jogador = linha_atual.index "H"
		if posicao_jogador
			jogador = Jogador.new
			jogador.linha = linha
			jogador.coluna = posicao_jogador
			return jogador
		end
	end
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
	jogador.linha += movimento[0]
	jogador.coluna += movimento[1]

	if colisao_barreira? jogador.to_array, mapa
		return jogador_posicao_atual, false
	end

	monstros = posicoes_monstros mapa

	if colisao_monstros? jogador.to_array, monstros, mapa
		return jogador, true
	end 
	
	jogador_posicao_atual.remove_do mapa
	jogador.posicione_no mapa

	return jogador, false
end
