require_relative "business_colisao"

def movimenta_monstro mapa
	mapa.each_with_index do | linha_atual, num_linha |
		caracteres_da_linha = linha_atual.chars
		caracteres_da_linha.each_with_index do |caractere_atual, num_caractere|
			if caractere_atual == icone_monstro
				monstro = [num_linha, num_caractere + 1]
				if colisao_barreira? monstro, mapa
					break
				end
				mapa[num_linha][num_caractere] = " "
				mapa[num_linha][num_caractere + 1] = icone_monstro
			end
		end
	end
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