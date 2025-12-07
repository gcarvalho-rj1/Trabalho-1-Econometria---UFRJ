#######################################################
# Projeto: Trabalho Econometria Questão 3
# Objetivo: Gera a base necessária para as outras tarefas
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Dezembro de 2025
#######################################################

# input:
# output: dados

# Carrega os dados que serão utilizados
dados <- read.dta13(file.path(dir_input, "smallmo.dta"))

save(dados, file = file.path(dir_tmp, "base_inicial.RData"))

