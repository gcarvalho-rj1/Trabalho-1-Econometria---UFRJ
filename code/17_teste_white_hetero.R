#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Realizar um teste white para testar a presença de heterocedasticidade em regress_4 com log_wage_hetero
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: regress_4_hetero
# output: teste_white_hetero
#######################################################

# Carrega a regressão feita sobre as variáveis
load(file.path(dir_tmp, "regress_4_hetero.RData"))


# Faz o teste white
teste_white_hetero <- bptest(regress_4_hetero, ~ fitted(regress_4_hetero) + I(fitted(regress_4_hetero)^2))

# Salva o resultado do teste
save(teste_white_hetero, file = file.path(dir_tmp, "teste_white_hetero.RData"))
