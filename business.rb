require_relative "ui"

def icone_vazio
	" "
end


def icone_barreira
	"X"
end


def icone_jogador
	"H"
end


def monstro
	"M"
end


def le_mapa
	mapa_file = File.read "mapa_estagio_I.txt"
	desenho_do_mapa = mapa_file.strip.split("\n")
	desenho_do_mapa
end


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


def colisao? jogador, jogada, mapa
	linha = jogador[0]
	coluna = jogador[1]

	if fora_limite_mapa? mapa, linha, coluna
		return true
	end

	if mapa[linha][coluna] == icone_barreira
		return true
	end

	return false
end


def movimenta_jogador jogador, jogada, mapa

	jogador_posicao_atual = jogador.dup

	case jogada
		when "W"
			jogador[0] -= 1
		when "A"
			jogador[1] -= 1
		when "D"
			jogador[1] += 1
		when "S"
			jogador[0] += 1
	end

	if colisao? jogador, jogada, mapa
		return jogador_posicao_atual
	end
	
	posiciona_jogador jogador_posicao_atual, mapa, icone_vazio
	posiciona_jogador jogador, mapa, icone_jogador

	jogador
end



def inicia_jogo

	exibe_inicializacao
	solicita_jogador
	mapa = le_mapa	
	desenha_mapa mapa
	loop do
		jogada = executa_jogada
		jogador = encontra_jogador mapa
		movimenta_jogador jogador, jogada, mapa
		desenha_mapa mapa

	end
end
