#Os pacotes necessarios para essa atividade sao:
install.packages("lm.beta")
install.packages("gvlma")
install.packages("sandwich")
library(sandwich)
library(gvlma)
library(car)
library(lm.beta)
library(lmtest)
library(MASS)

#Carregando base de dados - USArrests
regAssault <- lm(Assault ~ ., data = USArrests) 
summary(regAssault) # Aqui, temos como resultados, uma maior relacao com Murder e com Rape
lm.beta(regAssault) # COEFICIENTES PADRONIZADOS

#Verificacao dos residuos da regressao
shapiro.test(residuals(regAssault)) #Verificacao de residuos. p-value = 0.2915, o que significa que a hipótese nula nao pode ser descartada. Ou seja, os residuos sao normais.
plot(regAssault, which=1, col=c("blue")) # resíduos x ajuste. Carolina do Norte, Delaware e Havai sao casos apontados como possiveis outliers
plot(regAssault, which=2, col=c("red")) # Q-Q Plot. Os mesmos estados se destacam
plot(regAssault, which=5, col=c("blue"))  # Observações Influentes. Aqui, alem da Carolina do Norte, Rhode Island e Georgia tambem sao apontados como casos a serem observados, jmas nao chegam a ser considerados perigos pois ainda estao longe da maegem de 0.5

# inflação da variância / multicolinearidade
vif(regAssault) #Com valores inferiores a 2, nao ha a necessidade de retirar variaveis

#Teste de homocedasticidade 
bptest(regAssault) 
plot(regAssault, which=3, col=c("blue"))  # Scale-Location Plot

# Correção com estimativas robustas
regAssault$robse <- vcovHC(regAssault, type = "HC1")
coeftest(regAssault, regAssault$robse)
