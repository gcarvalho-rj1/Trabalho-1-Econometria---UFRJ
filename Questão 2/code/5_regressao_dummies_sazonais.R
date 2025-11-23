#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Estimando o modelo com as dummies sazonais
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: dados
# output: regress_2, regress_2_tabela

load(file.path(dir_tmp, "base_inicial.RData"))


regress_2 <- lm(setor02 ~ cambio + ibcbr + fev + mar + abr + mai + jun + jul + ago + set + out + nov,
              data = dados)


# Mostrar os resultados da regressão com dummies sazonais via stargazer
stargazer(regress_2, type = "html", out = file.path(dir_output, "regress_2_tabela.html"),          
          title = "Resultados da Regressão com dummies sazonais",
          align = TRUE)

save(regress_2, file = file.path(dir_tmp, "regressao_2.RData"))
