#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Realizando o teste Ljung-Box no modelo com dummies sazonais
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: regressao_2
# output: ljung_box_2

load(file.path(dir_tmp, "regressao_2.RData"))


# Realiza o teste
res_2 <- residuals(regress_2)

ljung_box_2 <- Box.test(res_2, lag = 12, type = "Ljung-Box")

save(ljung_box_2, file = file.path(dir_output, "ljung_box_2.RData"))
