
# pacotes -----------------------------------------------------------------

library(tidyverse) #ou carrega o tidyverse completo 

options(max.print = 999999)

# importação --------------------------------------------------------------

all_deaths <- read.csv("all_deaths.csv", na.strings="") #importação com o pacote básico
all_jails <- read_csv("all_jails.csv") #importação com o readr do tidyverse


# Conhecendo o banco ------------------------------------------------------

View(all_deaths) #vê o banco na interface gráfica

str(all_deaths) #mostra a estrutura do banco e das variaveis
glimpse(all_deaths) #mesma coisa que o str mas com o tidyverse

summary(all_deaths) #resumo das variáveis

head(all_deaths) #mostra primeiros casos (6 no padrão)
head(all_deaths, 50) #mostra 50 primeiros casos
tail(all_deaths) #mosra os últimos casos

all_deaths[,is.numeric(all_deaths)]
Filter(is.numeric, all_deaths) #filtra apenas as variavéis numéricas

#seleção de colunas 
deaths_AL$state #nova sintaxe, usa o $ para selecionar colunas no df

all_deaths$state_cat <- factor(all_deaths$state) #transforma a variavels state em uma nova variável categórica
#factor() como padrão coloca os niveis em ordem alfabetica, se quiser mudar a ordem tem que usar o argumento levels = c("", "") com todos os niveis, na ordem desejada
levels(all_deaths$state_cat) #verifica os níveis da variável state_cat
summary(all_deaths) #resumo novamente, veja como aparece a variável state_cat

#filtragem do banco em novos bancos
names_full <- subset(all_deaths, !is.na(all_deaths$full_name)) #só aqueles que tem o nome completo
deaths_AL <- subset(all_deaths, state == "AL") #só aqueles do estado AL

range(all_deaths$age, na.rm= T) #verifica o intervalo de idades
jovens_MI <- subset(all_deaths, (state == "MI" | state == "AL") &  (age < 30 & age > 25)) #filtra por estado e por idade

#mudar a ordem do banco
ordem<-order(deaths_AL$age, decreasing = T) 
deaths_AL_iddec <- deaths_AL[order(deaths_AL$age, decreasing = T),]


# Lista -------------------------------------------------------------------
#listas agregaram vários tipos de objetos

lista <- list(jovens_MI, names_full, x, y, ordem) #cria lista com dfs, vetores e objetos
lista[[3]] #seleciona o objeto 3 da lista. Atenção para a sintaxe [[]]


lista[[1]][1,5] #seleciona elementos dentro do elemento 1 da lista
lista[[1]]$county #como o elemento 1 é um df, podemos selecionar a coluna usando $


# tidyverse ---------------------------------------------------------------

#se nao quiser carregar o tidyverse inteiro, carrega só esses dois
library(dplyr)
library(magrittr)

str(all_deaths)

#Atenção, nova sintaxe usando o pipe %>% 
all_deaths %>% 
  group_by(state, county, year) %>% #agrupa por state, county e year
  tally() #conta ocorrencias

all_deaths %>% 
  select(state, county, jail, age) %>% #seleciona apenas algumas variaveis
  mutate(county = factor(county), #transforma county em factor
         age2 = age * 100) #criar variavel age2, multiplicando age por 100

x <- all_deaths %>% 
  select(age) %>% #seleciona apenas age
  arrange(age, na.rm=T) #orderna por idade

x <- all_deaths %>% 
  select(age) %>% #seleciona apenas age
  arrange(desc(age), na.rm=T) #orderna por idade em ordem decrescente

#filtrar com o tidyverse

all_deaths %>% 
  select(state, county, jail, year, date_of_death, cause_detail, age, race, gender) %>% 
  filter(state == "AL" & age > 30)


