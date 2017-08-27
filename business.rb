require_relative "ui"
require_relative "util"
require_relative "business_colisao"
require_relative "business_jogador"
require_relative "business_monstro"


def le_mapa
	mapa_file = File.read "mapa_estagio_I.txt"
	desenho_do_mapa = mapa_file.strip.split("\n")
	desenho_do_mapa
end



def inicia_jogo

	exibe_inicializacao
	solicita_jogador
	mapa = le_mapa	
	desenha_mapa mapa
	loop do
		jogada = executa_jogada
		jogador = encontra_jogador mapa
		movimenta_monstro mapa
		jogador, colisao = movimenta_jogador jogador, jogada, mapa
		desenha_mapa mapa

		if colisao
			exibe_fim_de_jogo
			break
		end

	end
end
