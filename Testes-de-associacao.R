##Inicio carregando os pacotes usados
install.packages("ccaPP")
library(ccaPP)
install.packages("lsa")
library(lsa)
install.packages("minerva")
library(minerva)
install.packages("Rfast")
library(Rfast)
iris$

#Seleciono as colunas que serão usadas da base nativa iris e salvo em "dados_cor" 
dados_cor <- iris %>%
  select(Sepal.Length, Petal.Length)

#Crio uma função para analisar os dados
funcao <- function(x, y) {
  c(
    cor = cor(x, y), # Correlação
    dcor = dcor(x, y), # Distance correlation
    cosine = cosine(x, y), # Distância do Cosseno 
    maxCor = maxCorProj(x, y), # Maximal correlation
    MIC = mine (x, y) #  Maximal Information Coefficient
  )
}

#Crio um objeto que contém os dados de interesse

plot(dados_cor$Sepal.Length, dados_cor$Petal.Length)

corList <- funcao(dados_cor$Sepal.Length, dados_cor$Petal.Length)
names(corList)
corList <- corList[c(1,5,6,7, 15)]
corList

#Por ser uma função linear, todas as estatísticas encontram correlacao