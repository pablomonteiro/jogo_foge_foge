## Jogo Foge-Foge



### AULA 1
Mostra o conceito de matriz e vetor, onde matriz no mundo da programação é utilizada para representar algo com duas dimensões ou mais. Enquanto que um vetor é utilizado para representar uma única dimenção.

Utilização do IF: No Ruby, caso a condição existente no IF seja nula(nil), o valor é considerado FALSE;

Utilização de laços funcionais com os métodos EACH e EACH_WITH_INDEX: 

**Conceito do Duck Type**: Não se preocupa com o tipo específico de uma variável, mas sim se essa variável tem um comportamento desejado ou não. 

EX: Acessar a primeira letra da primeira String de um Array de String. ```meuArray[0][0]```.
 > ```meuArray``` => Array

 > ```meuArray[0]``` => String

 > ```meuArray[0][0]``` => Primeiro caracter da String

 Ou seja, nesse caso, a String está se comportando com um Array.

 **OBS**: Cuidado com os pseudos Duck Types. São objetos que podem até ter nomes de funções semelhantes, mas que possuem comportamentos distintos.

 Passar um Array por referência para uma outra função significa que, qualquer alteração realizada nesse Array refletirá na origem. Mas se esse Array for copiado, a referência morre.

 Para realizar a duplicação/cópia de um array, pode-se utilizar afunção ARRAY.dup