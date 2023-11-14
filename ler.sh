#!/bin/bash
######################
#Script leitura de arquivo
#Autor: julio
#Args:
#Contato: juliocv001@gmail.com
#Description:
#Script para ler palavras de um arquivo combinadas com outro arquivo
####################
#declaraçao de variais
dominio="inserirdominio.com.br"
dirpalav="/local/doscript/script"
arquivo="arquivo_de_palavras.txt"
#arquivo de palavras deve estar dentro do diretorio do script
cria_log (){
touch ./inexistente.txt
touch ./link_valido.txt
}
testa_link () {
while read linha
	do
		if ! ping -c 2 $linha.$dominio >/dev/null; then
				echo "$linha.$dominio" >> ./inexistente.txt
		else
				echo  "$linha.$dominio" >> ./link_valido.txt
		fi
	done < $dirpalav/$arquivo
}
cria_log
testa_link
