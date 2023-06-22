## CORRELAÇÃO COM R ##
# PRIMEIRO, VAMOS CARREGAR OS PACOTES
library(corrplot)
library(dplyr)
library(ggplot2)
library(readxl)
install.packages("psych")
library(psych)
#Inicio carregando minha base de dados
dados_bib <- read_xlsx("C:/Users/isabe/OneDrive/Área de Trabalho/analise_de_dados/Data/Dados compilados - Scopus.xlsx")

#Seleciono as colunas que serão usadas e salvo em "dados_cor" e as 
#Transformo os dados textuais em fatores
dados_cor <- dados_bib %>%
  select(Affiliations, 'Cited by', 'Source title') %>%
  mutate (Affiliations = factor(Affiliations),
          'Cited by' = factor(`Cited by`),
          'Source title' = factor(`Source title`)) %>%
  na.omit()
 

#Transformo os fatores em dados numéricos
dados_cor <- sapply(dados_cor, function(x) if(is.factor(x)) as.numeric(x) else x)

#Então calculo a correlação
cor(dados_cor)
