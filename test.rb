mapa_file = File.read "mapa_estagio_I.txt"
mapa = mapa_file.strip.split("\n")
# novo mapa sem os monstros
mapa_novo = mapa.join("\n").tr("M", " ").split("\n")

mapa.each_with_index do | linha_atual, linha |
	linha_atual.chars.each_with_index do |string, coluna|
		if string == 'M'
			puts "Imprime #{string} #{linha} #{coluna}"
			mapa_novo[linha][coluna + 1] = "M"
		end
	end
end


puts mapa
puts ""
puts mapa_novo