#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Realiza o teste Ljung-Box
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: regressao_1
# output: ljung_box

load(file.path(dir_tmp, "regressao_1.RData"))

# Calcula os residuos
res1 <- residuals(regress_1)

# Realiza o teste Ljung-box
ljung_box <- Box.test(res1, lag = 12, type = "Ljung-Box")

save(ljung_box, file = file.path(dir_output, "ljung_box.RData"))



