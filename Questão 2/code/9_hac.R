#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: gera a base de dados
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: regress_3
# output: hac

load(file.path(dir_tmp, "regressao_3.RData"))


hac <- coeftest(regress_3, vcov = NeweyWest(regress_3, lag = 12, prewhite = FALSE))

save(hac, file = file.path(dir_output, "hac.RData"))
