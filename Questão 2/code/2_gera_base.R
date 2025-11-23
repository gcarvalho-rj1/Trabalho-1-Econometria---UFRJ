#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Gera a base necessária para as outras tarefas
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input:
# output: dados, setor_vars

# Carrega os dados que serão utilizados
dados <- read_excel("input/T2dados.xls")

# Gera um objeto para salvar o nomes das variáveis setor. Utilizaremos posteriormente
setor_vars <- names(dados)[str_detect(names(dados), "^setor")]


save(dados, file = file.path(dir_tmp, "base_inicial.RData"))
save(setor_vars, file = file.path(dir_tmp, "setor_vars.RData"))

