#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Realiza a regressão por câmbio e ibcbr e salva os resultados
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: dados
# output: regress_1

load(file.path(dir_tmp, "base_inicial.RData"))

# Realiza a regressão
regress_1 <- lm(setor02 ~ cambio + ibcbr, data = dados)


# Gera a tabela com o resultado da regress_1
stargazer(regress_1, type = "html", out = file.path(dir_output, "regress_1_tabela.html"),          
          title = "Resultados da Regressão: Inflação (setor 2) por câmbio e ibcbr")


save(regress_1, file = file.path(dir_tmp, "regressao_1.RData"))
