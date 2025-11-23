#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Gerar a tabela com os valores da regressão 4 hetero utilizando o stargazer 
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: regress_4
# output: regress_4_hetero_tabela
#######################################################

# Carrega a regressão feita sobre as variáveis
load("C:/Users/apdua/Desktop/Mario/Trabalho Econometria/Questão 1/tmp/regress_4_hetero.RData")

# Gera a tabela com o resultado da regress_4
stargazer(regress_4_hetero, type = "html",
          out = file.path(dir_output, "regress_4_hetero_tabela.html"),          
          title = "Resultados da Regressão: Log do Salário héterocedástico",
          align = TRUE, dep.var.labels = "log_wage_hetero", covariate.labels = 
            c("Educação (anos)", "Experiência", "Experiência²", "Homem", "Branco", "Região Norte", "Região Nordeste", "Região Sul", "Região Centro-Oeste"
            ))
