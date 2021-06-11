################################################################# Introdução ao R #################################################################
##################################################################### Aula 1 ######################################################################
################################################################### 10 de junho ###################################################################

# Objetos simples ---------------------------------------------------------

#para atribuir variavel '<-' a seta sempre tem que apontar para o nome da variavel
#prefiram nomes com letras minusculas

#objetos numéricos
x <- 5 #cria o objeto x armazenando 5 
x <- x + 2 #adiciona 2 ao objeto x sobrescrevendo-o (recursivo)

class(x) #classe do objeto

#objeto do tipo char (texto/string)
nome <- "meu nome é Iara" 
fora <- 'Fora Bolsonaro'

length(nome) #tamanho do objeto nome
length(fora)

length(nome) == length(fora) #o objeto nome é do mesmo tamanho (length) que o objeto fora?

?mean #abre a documentação da função "mean" - precisa ter acesso a internet

#objetos booleanos (TRUE/FALSE)
z <- TRUE
w <- FALSE
x <- FALSE

z == w #objeto z é igual a objeto w - resposta sempre vai ser boolean
z != w #objeto z é diferente do objeto w?

#Atenção para o operadores | (ou) e & (e)

z == w | x != z & w == x #z é igual a w ou x é diferente de z e w é igual a x?

#atribuição com '<-' funciona em ambos os sentidos, a seta aponta para o objeto 
x <- 5
5 -> x

#ATENÇÃO - quando armazenamos resultados de funções em uma variável devemos entender o que cada função retorna.
#É um número? É um booleano? É um vetor? É uma posição?

# Vetores -----------------------------------------------------------------

#vetores são arrays unidimensionais
#para criar um vetor usamos a função "c()"
#c = concatenar
#um vetor nada mais é como uma concatenação de objetos, é como um "trenzinho"

vetor_num <- c(5, 4, 56, 78) #vetor numérico
nome_vetor <- c("meu", "nome", "é", "iara") #vetor char
vetor_logico <- c(T, F, FALSE) #vetor lógico

vetor1 <- c(0, 1, 1)
vetor2 <- c(5, 1, 7, 2, 13)

vetor1 + vetor2 #soma de vetores

sum(vetor1) #soma de valores internos do vetor1

soma_vetor2 <- mean(vetor2) #média do vetor2
#Atenção! O objeto se chama soma_vetor2, mas ele armazena a média!

length(vetor1) #tamanho do vetor 1

# [] indica endereço, a casinha do vetor e não o valor armazenado dentro delas
vetor2[3:5] #seleciona endereços, "casinhas", 3 a 5 do vetor2
vetor2[c(1,5)] #seleciona endereços 1 e 5 do vetor2

nome_vetor[3] #seleciona apenas a casa 3

#substituição do valor da "casa" 4 do vetor2 com o valor da casa 2 do vetor1
vetor2[4] = vetor1[2] #ATENÇÃO! "=" é atribuição e "==" é comparação
vetor2[4] <- vetor1[2] #mesma coisa, mas usando a sintaxe "<-"

#se quero saber se o valor armazenado dentro de uma casinha de um vetor é igual a outra casinha
#(do mesmo vetor ou de outro vetor) preciso usar "==" e não "="

vetor2[vetor2>10] #há alguma casinha do vetor2 com algum valor armazenado maior do que 10?
which(vetor2 > 10) #qual casinha do vetor2 tem armazenado um valor maior do que 10?
which(nome_vetor == "iara") #qual casinha do vetor nome_vetor tem o char iara?
vetor2 > 10 #retorna um booleano para cada casinha, respondendo a pergunta: o valor armazenado nessa casinha é maior do que 10?

#vetores só podem ser de um tipo! (int, num, char, logi)
#se crio um vetor com tipos diferentes o R obriga todos os objetos serem do mesmo tipo
#respeitando a seguinte lógica: char > num > int > logi

vetor_teste <- c("1", 1, T) #de que classe esse vetor será?

#Atenção! Lembre-se de que tudo que abrimos temos que fechar, (), [], {} e ""
#Nas novas versões do RStudio há uma configuração em Global Options > Code > Display > Rainbow Parenthesis
#Facilita na hora de vermos os parentêses e outros abertos

#adicionar valores no vetor

#endereçamento direto - aqui preciso saber o tamanho do vetor 
vetor1[x + 1] <- 4 #ATENÇãO, substitua o "x" pelo tamanho do vetor 

#endereçamento indireto - não preciso saber o tamanho do vetor, posso usar a função lenght()
vetor1[length(vetor1) + 1] <- 9

#modo recursivo - substituo o próprio vetor por ele mesmo e um 10 no final
vetor1 <- c(vetor1, 10) 

#excluir itens dentro de um vetor
vetor1 <- vetor1[-c(1:3)] #substituo o vetor1 pelo proprio vetor1 sem as casas de 1 a 3

# Funções -----------------------------------------------------------------

#Funções são códigos pré-programados que facilitam a realização de operações. 
#Não sendo necessário criar uma função do zero, o R é repleto de funções!
#Pacotes são conjuntos de funções
#Quando instalamos o R, algumas funções já são instaladas juntas com o R Base
#Outras são instaladas juntas com pacotes adicionais
#Outras precisamos instalar outros pacotes para poder usá-las
#Para instalar um pacote novo usamos install.packages("nome do pacote")
#Para ver a documentação referente a uma função utilize ?nomefunção ou a busca do Help na janela do canto inferior direito do RStudio

#Concatenação de funções
#posso concatenar funções para não ter que usar muitas linhas de códigos se preciso usar só o resultado final da concatenação
#sempre leia de dentro pra fora

#isso
x<- length(mean(sum(vetor2, na.rm = T), na.rm = F))

#é a mesma coisa que isso:
x <- sum(vetor2, na.rm = T)
y <- mean(x, na.rm = T)
z <- length(y)

#e isso:
x <- sum(vetor2, na.rm = T)
x <- mean(x, na.rm = T)
x <- length(x)
vetor2 <- rev(vetor2)

#qual é a diferença das três formas?

#criar sequências
seq(10000, 300000, by = 50)

#criar repetições - qual a diferença entre elas?
rep(5,3)
rep(1:5, 3)
rep(1:5, each = 3)

#tamanho da sequência de 130 a 209
length(130:209)

#qual é o resultado dessa concatenação?
rep(rev(seq(1,18, by = 3)), times = 5)

# Matrizes ----------------------------------------------------------------
# Matrizes são arrays bidimensionais
# Agora meus endereços precisam ter endereço da coluna e da linha
# Herdam a mesma propriedade do vetor - SÓ PODEM SER DA MESMA CLASSE!

#Função para criar matriz - matrix()
#Agora precisamos ter o argumento de número de linhas 'nrow'
#ou número de colunas 'ncol'
#Também preciso indicar se eu quero preenchê-la por linhas 
#ou por colunas - o default é byrow = F
matrix(nrow = 3, ncol = 2) #matriz vazia
matrix(1:30, nrow = 3, byrow = T) #matriz de 1 a 30 com 3 linhas preenchida por linhas

#também posso concatenar vetores e transformá-los em matriz
linha <- c(vetor1, vetor2, x, 5)
matriz1 <- matrix(linha, nrow = 7)
#ATENÇão! Eu consigo fazer operações entre matrizes se elas forem do mesmo tamanho
# o operador * multiplica item por item mas não é o equivalente da multiplicação de matrizes
# a multiplicação de matrizes é necessário ter uma matriz A com o número de colunas que a matriz B tem de linhas
# o operador para a multiplicação de matrizes é %*%
# Para mais informações https://www.geeksforgeeks.org/matrix-multiplication-in-r/

# Eu consigo fazer operações de uma matriz com vetores ou objetos únicos (escalares)
#Observe o que acontece em cada um dos casos:
matriz1 * vetor1
matriz1 * 3

#Endereçamento de matrizes
#Por ser objeto bidimensional, preciso indicar a linha e coluna sempre
#A sintaxe sempre é matriz[linha, coluna]
matriz[1,3] #linha 1 e coluna 3
matriz[3,1] #linha 3 e coluna 1

#se deixo um dos itens vazios seleciono o outro item inteiro
matriz[,3] #coluna 3 inteira
matriz[1,] #linha 1 inteira

matriz[c(2,3),c(3,5)] #seleciona as linhas 2 e 3 e as colunas 3 e 5
matriz[1:3, 2:5] #seleciona as linhas de 1 a 3 e colunas de 2 a 5
