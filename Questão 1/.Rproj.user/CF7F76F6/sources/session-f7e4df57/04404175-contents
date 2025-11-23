#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Realizar um teste white para testar a presença de heterocedasticidade em regress_4
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: regress_4
# output: teste_white_homo
#######################################################


# Carrega a regressão feita sobre as variáveis
load(file.path(dir_tmp, "regress_4.RData"))


# Faz o teste white
teste_white_homo <- bptest(regress_4, ~ fitted(regress_4) + I(fitted(regress_4)^2))

# Salva o resultado do teste
save(teste_white_homo, file = file.path(dir_tmp, "teste_white_homo.RData"))
