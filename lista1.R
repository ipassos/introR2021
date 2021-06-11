################################################################ LISTA 1 ################################################################
######################################################## INTRODUÇÃO AO R - 2021 #########################################################

################################################################ BLOCO 1 ################################################################
################################################### Criação e manipulação de variáveis ################################################## 

#1 - Crie 3 três objetos que armazena: 1) o teu ano de nascimento, 2) o ano atual, 3) a diferença entre o ano atual e o teu ano de nascimento. 


#2 - Pergunte para o R qual é a classe do objeto criado no exercício anterior


#3 - Substitua a variável ano de nascimento por um outro ano. O que acontece com as outras variáveis? 
# Se eu quero mudar a variável da diferença entre os anos o que preciso fazer?

################################################################ BLOCO 2 ################################################################ 
################################################################ Vetores ################################################################

#4 - Crie 3 tipos de vetores de tamanho 5: um numérico, um textual e um lógico

#5 - Crie 3 vetores numéricos com 5 valores cada. Coloque valores negativos também.

#6 - Crie um novo vetor que seja a soma dos 3 vetores criados anteriormente

#7 - Dê nomes aos elementos de cada vetor (incluindo o vetor soma). 
# Para dar nome aos vetores utilize a função names() - procure a documentação para ver como utilizá-la
# Utilize qualquer nome mas lembre-se que nomes são textuais e precisam estar entre ""

#8 - Faça a soma interna dos valores do vetor. Armazene cada soma em uma nova variável (inclusive do vetor soma).
#Qual a diferença do resultado do exerício 6 para o resultado do exercício 8?

#9 - Verifique se o primeiro valor do segundo vetor tem valor maior que o primeiro valor do 3 vetor. 

#10 - Verifique se o último valor do vetor 3 tem o mesmo valor que o segundo valor do vetor 1
# Faça de forma indireta e direta

#11 - Verifique se alguma das somas são iguais (exercício 8)

#12 - Selecione dois elementos sequenciais de um dos vetores e atribua a uma variável. 

#13 - Selecione 3 elementos não sequenciais e atribua a uma variável.

#14 - Selecione os três primeiros elementos do vetor usando os seus nomes. Atribua a uma variável.

#15 - Calcule a media dos valores de um dos vetores. 

#16 - Verifique qual dos valores de cada vetor são positivos. E quais são negativos. 
#Atribua os dois desses resultados a um objeto. 

#17 - Descubra quais valores são "TRUE" em cada uma das variáveis criadas no exercício anterior. 

#18 - Inverta um dos vetores. O que aconteceu com a variável original? Foi alterada?

#19 - Descubra a variancia, o valor maximo e minimo, o intervalo e o desvio padrao de vetores a sua escolha (dentre os vetores paises). 
#Funções: var(), max(), min(), range(), sd() 

#20 - Adicione os valores das somas de cada vetor no final de cada vetor. 

################################################################ BLOCO 3 ################################################################ 
############################################################### Matrizes ################################################################

## Recrie os vetores anteriores de modo que não tenhamos mais a soma no final de cada um deles. 
#Dica: apenas rode novamente o código da criação dos vetores. Não rode a função names()

#21 - Crie uma matriz a partir dos vetores criados anteriormente. Armazene em uma nova variável. 
#Verifique se o argumento "byrow" deve ser TRUE ou FALSE 

#22 - Coloque os respectivos nomes das linhas e das colunas na matriz criada. 
#Dica - procure as funções rownames() e colnames()

#23 - Efetue a soma das colunas e linhas e adicione-as na matriz. 
#A matriz deve ficar no final como se cada vetor fosse uma linha da matriz
# Tenha isso em mente na hora de conferir a sua matriz

#24 - Selecione o primeiro elemento da terceira linha da matriz.

#25 - Selecione o segundo elemento da ultima coluna da matriz.

#26 - Selecione a primeira linha inteira.

#27 - Selecione a quinta coluna inteira.

#28 - Selecione a primeira e terceira linha das colunas 2 e 5. 

################################################################ BLOCO 4 ################################################################### 
############################################################# Desafio final ################################################################

#As funções colSums() e rowSums() são equivalentes da função sum() para matrizes
#As funções cbind() e rbind() adicionam colunas e linhas em uma matriz
#Crie uma nova matriz que tenha uma nova linha que seja a soma das linhas anteriores e 
#uma nova coluna que seja a soma das colunas anteriores, utilizando essas novas 4 funções
#Atenção! Leia a documentação de cada função antes. 
#Atenção!! Dependendo da ordem que utilizamos as funções teremos resultados MUITO diferentes e diferentes do que desejamos. 
#Dicas: 
#1) pense (ou anote no papel) qual é o resultado desejado, 
#2) entenda como cada função funciona, 
#3) use-as na ordem certa para chegar ao resultado desejado