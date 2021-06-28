library(tidyverse)
library(lubridate)

library(tidyverse)

#importa banco 
#banco precisa estar na mesma pasta que o projeto ou indicar o endereço completo
all_deaths <- read.csv("~/MEGA/R/intro2021/all_deaths.csv", na.strings="")
all_jails <- read.csv("~/MEGA/R/intro2021/all_jails.csv", na.strings="")

#tranforma as colunas de d2008 a ac2019 em categorias da variável "sub_year" e os valores na variável "count"
#depois separa a coluna sub_year em duas, para podermos ter uma coluna só com o ano
#no separador utilizamos o regex que identifica a primiera ocorrencia de um algarismo numérico e separa a string
all_jails_longer <- all_jails %>% 
  pivot_longer(cols = d2008:ac2019, names_to = "sub_year", values_to = "count") %>% 
  separate(sub_year, into = c("sub", "year"), sep = "(?<=[a-zA-Z])(?=[0-9])")

#faz o processo contrário, primeiro unindo as duas colunas
all_jails_wider <- all_jails_longer %>% 
  unite(sub_year, sub, year, sep = "") %>% 
  pivot_wider(names_from = "sub_year", values_from = "count")

#no banco longer a contgem não é mais por linhas mas sim, deve-se fazer
#a soma dos valores agrupados
all_jails_longer %>% 
  select(state, county, jail, year, count) %>% 
  group_by(county, year) %>% 
  mutate(total_ano = sum(count)) %>% 
  select(-count) 

# Banco homicídios --------------------------------------------------------

#importa banco 
#banco precisa estar na mesma pasta que o projeto ou indicar o endereço completo 
homicidios_sp_2020 <- read.csv("homicidios_sp_2020.csv", na.strings="")

homicidios_sp_2020 <- homicidios_sp_2020[-3519,] #retira a linha 3519, estava dando problema

#converte as duas variaveis em datas
homicidios_sp_2020 <- homicidios_sp_2020 %>% 
  mutate(DATAOCORRENCIA = ymd(DATAOCORRENCIA),
         DATANASCIMENTO = ymd(DATANASCIMENTO))

#exemplo de ocorrencia "problematica" - 27 registros com a mesma data de nascimento 
ex <-homicidios_sp_2020 %>% 
  filter(ANO_BO == 2020 & NUM_BO == 19 & DATANASCIMENTO == "1978-09-30")

#tabela de frequencia
table(homicidios_sp_2020$TIPOPESSOA)

#filtra o banco, seleciona colunas, transforma em factor algumas variaveis e renomeia a variavel CORCUTIS
homicidios_sp_2020_red <- homicidios_sp_2020 %>% 
  filter(ANO_BO == 2020) %>% 
  filter(DATAOCORRENCIA > "2020-01-01" & DATAOCORRENCIA < "2020-12-31") %>% 
  select(-c(X, PLACA_VEICULO, UF_VEICULO, CIDADE_VEICULO, DESCR_COR_VEICULO, 
            ANO_FABRICACAO, ANO_MODELO, DESCR_TIPO_VEICULO, QUANT_CELULAR, MARCA_CELULAR, DESCR_MARCA_VEICULO)) %>% 
  mutate(across(c(1,2,3,11,12,17,24,25,29,30,31,34,37,39), factor)) %>% 
  rename(RACA = CORCUTIS) %>% 
  filter(!is.na(CIDADE)) 

glimpse(homicidios_sp_2020_red)

#separa banco em um banco de ocorrencia, outro de crimes e outro de pessoas
#agora cada banco tem um caso por linha
ocorrencia <- homicidios_sp_2020_red %>% 
  select(ANO_BO, NUM_BO, CIDADE, DELEGACIA_CIRCUNSCRICAO, DELEGACIA_NOME, DATAOCORRENCIA) %>% 
  distinct()

crimes <- homicidios_sp_2020_red %>% 
  select(ANO_BO, NUM_BO, CIDADE, DELEGACIA_CIRCUNSCRICAO, DELEGACIA_NOME, 
         DATAOCORRENCIA, ESPECIE, RUBRICA, DESDOBRAMENTO) %>%
  distinct() %>% 
  mutate(DESDOBRAMENTO = replace_na(DESDOBRAMENTO, " ")) %>% 
  unite(TIPO_CRIME, ESPECIE, RUBRICA, DESDOBRAMENTO, sep = " ")

pessoas <- homicidios_sp_2020_red %>% 
  filter(!is.na(DATANASCIMENTO)) %>% 
  filter(!is.na(TIPOPESSOA)) %>% 
  select(ANO_BO, NUM_BO, CIDADE, DELEGACIA_CIRCUNSCRICAO, DELEGACIA_NOME, 
         DATAOCORRENCIA, TIPOVINCULO, TIPOPESSOA, VITIMAFATAL, SEXO, IDADE, 
         ESTADOCIVIL, RACA, GRAUINSTRUCAO) %>% 
  distinct() %>% 
  mutate(TIPOPESSOA = factor(TIPOPESSOA)) %>% 
  filter(TIPOPESSOA != "Encontrado")

#tabela cruzada proporcional por linha e por coluna
prop.table(table(pessoas$TIPOPESSOA, pessoas$SEXO), 1)
prop.table(table(pessoas$TIPOPESSOA, pessoas$SEXO), 2)

#faz uma base final usando "join"
base <- pessoas %>% 
  left_join(crimes, by= c("ANO_BO", "NUM_BO", "CIDADE", "DELEGACIA_CIRCUNSCRICAO", "DELEGACIA_NOME"))
