#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Criar as tabelas com as estatísticas descritivas
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: data
# output: descritivas, descritivas_pt_2
#######################################################


# Carrega a base de dados
load(file.path(dir_input, "base_inicial.RData"))


# Cria a tabela com as estatísticas descritivas
stargazer(data, type = "html", 
          out = file.path(dir_output, "descritivas.html"), title = "Estatísticas descritivas da base inicial",
          summary.stat = c("mean","median","sd","min","max","n")
)

# Cria a função do coeficiente de variação
coef_variacao <- sapply(data, function(a) sd(a) / mean(a))

# Cria a tabela com o coeficiente de variação
stargazer(coef_variacao, type = "html", 
          out = file.path(dir_output, "descritivas_pt2.html"), title = "Coeficiente de variação da base inicial"
)
