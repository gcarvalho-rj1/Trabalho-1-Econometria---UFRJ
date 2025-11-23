#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Reportar os resultados do teste white feito em regress_4
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: teste_white_homo
# output: teste_white_log_wage_homo
#######################################################

# Carrega o teste white feito sobre a regress_4
load(file.path(dir_tmp, "teste_white_homo.RData"))



# Criar data.frame para o stargazer reconhecer o formato
tabela_white_homo <- data.frame(statistic = teste_white_homo$statistic,
                                parameter = teste_white_homo$parameter,
                                p_valor = teste_white_homo$p.value
)

# Cria a tabela com os resultados do teste white
stargazer(tabela_white_homo, type = "html", summary = FALSE, rownames = FALSE,
          out = file.path(dir_output, "teste_white_log_wage_homo.html"),
  title = "Teste White para Heterocedasticidade – log_wage_homo"
)

