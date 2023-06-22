#Qui quadrado

#Inicio carregando os pacotes usados
library(data.table)
library(ggplot2)
library(readxl)
library(psych)

#Faço o download a base de dados de câncer
breast_cancer <- fread('C:/Users/isabe/Downloads/An-lise-de-Dados/breast-cancer.data')

#Seleciono as colunas que serão usadas e salvo em "dados_cor" 
dados_cor <-breast_cancer[, c("V2", "V4")]
names(dados_cor) <- c("Idade", "Tamanho") 
View(dados_cor)

# TABELA DE CONTINGÊNCIA #
breast_cancer_table <- table(dados_cor$Idade, dados_cor$Tamanho)
breast_cancer_table

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
ggplot(dados_cor) + aes(x = Tamanho, fill = Idade) + geom_bar(position = "fill")

# TESTE QUI QUADRADO #
breast_cancer_test <- chisq.test(breast_cancer_table)
breast_cancer_test
breast_cancer_test$observed
breast_cancer_test$expected

# CORRPLOT DAS VARIÁVEIS #
corrplot(breast_cancer_test$residuals, is.cor = FALSE)
