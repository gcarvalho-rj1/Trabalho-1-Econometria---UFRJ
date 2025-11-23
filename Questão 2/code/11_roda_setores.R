#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Calcula o resultado dos setores
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: dados
# output: resultados_setores

load(file.path(dir_tmp, "base_inicial.RData"))

load(file.path(dir_tmp, "setor_vars.RData"))

source("code/10_funcoes_setores.R")

resultados_setores <- map(setor_vars, analisa_setor)

save(resultados_setores, file = file.path(dir_tmp, "resultados_setores.RData"))

