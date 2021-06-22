############################################################## LISTA 2 ##############################################################
###################################################### INTRODUÇÃO AO R - 2021 #######################################################

############################################################## BLOCO 5 ##############################################################
############################################################ Dataframes #############################################################

#29 - Transforme a matriz final da lista anterior em um dataframe. Atençao: necessario transpor a matriz

#30 - Crie o seguinte data frame (rode o código)

df <- data.frame(paste("0000", 1:25, sep = ""), #código
                 factor(rep(c("branca", "negra", "indígena"), c(10, 10, 5))), #repete as categorias
                 factor(rep(c("F","M"), c(13,12))), #repete as categorias
                 sample(c(16:50), 25, replace = T), #sorteio de idade
                 factor(rep(c("superior","tecnico", "medio"), c(5, 8, 12))), #repete as categorias
                 sample(seq(500, 30000, by = 500), 25, replace = T), #sequencia para formar a variavel renda
                 factor(rep(c("solteiro","casado", "viuvo", "separado"), c(5, 10, 2, 8)))) #repete as categorias
colnames(df) <- c("individuo", "raca", "sexo", "idade", "escol", "renda", "civil")#repete as categorias

#31 - Selecione as mulheres do seu data frame

#32 - Selecione os homens negros maiores de 30 anos do seu data frame

#33 - Selecione mulheres brancas com renda maior que 1500

#34 - Selecione pessoas com nivel superior que tem mais que 20 anos.

#35 - Ordene o seu data frame por ordem crescente de idade

############################################################## BLOCO 6 ############################################################## 
##############################################################  Listas ##############################################################

#36 - Crie uma lista com os vetores, matrizes e data frames que voce tem armazenado na memoria

#37 - Selecione um elemento dentro de uma matriz da sua lista

#38 - Selecione um caso (linha) dentro de um dataframe da sua lista

