#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Gera a tabela com os resultados da regress_fgls e regress_4_hetero
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: regress_fgls, regress_4_hetero
# output: resultado_FGLS
#######################################################


# Carrega as regressões
load(file.path(dir_tmp, "regress_4_hetero.RData"))
load(file.path(dir_tmp, "regress_fgls.RData"))



# Gera a tabela
stargazer(regress_4_hetero, regress_fgls, type = "html",
          out = file.path(dir_output, "resultado_FGLS.html"),
          title = "OLS x FGLS para log_wage_hetero")