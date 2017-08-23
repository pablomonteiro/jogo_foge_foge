require_relative "business"

def exibe_inicializacao
	puts "/ ******************** /"
	puts "/   BEM-VINDO AO JOGO  /"
	puts "/ ******************** /"
end


def solicita_jogador
	puts "Informe nome do Jogador:"
	jogador = gets.strip
	puts "Vamos inicial o jogo #{jogador}"
	jogador
end


def desenha_mapa mapa
	puts "\n\n\n"
	puts mapa
	puts "\n\n\n"
end

def exibe_comandos_do_jogo
	puts "/ ********** Execute uma Jogada ********** /"
	puts " W - up   A - left   D - right  S - down"
	puts "/ **************************************** /"
end



def executa_jogada
	puts "\n\n"
	exibe_comandos_do_jogo
	jogada = gets.strip.upcase
	jogada
end