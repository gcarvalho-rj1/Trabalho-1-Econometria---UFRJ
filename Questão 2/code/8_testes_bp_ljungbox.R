#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Realiza o teste ljung_box e Breusch–Pagan
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: regress_3
# output: ljung_box_3, bp_teste

load(file.path(dir_tmp, "regressao_3.RData"))



# Realiza os testes
ljung_box_3 <- Box.test(residuals(regress_3), lag = 12, type = "Ljung-Box")

bp_teste <- bptest(regress_3)


save(ljung_box_3, file = file.path(dir_output, "ljung_box_3.RData"))

save(bp_teste, file = file.path(dir_output, "bp_teste.RData"))
