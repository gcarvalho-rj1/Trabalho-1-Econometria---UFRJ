#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Incluindo as variáveis defasadas como variáveis independentes
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: dados
# output: regress_3

load(file.path(dir_tmp, "base_inicial.RData"))

dados <- dados %>% mutate(setor02_lag1 = lag(setor02, 1),
                          cambio_lag1 = lag(cambio, 1)
)


# Realiza a regressão
regress_3 <- lm(setor02 ~ cambio + ibcbr + setor02_lag1 + cambio_lag1 + fev + mar + abr + mai + jun + jul +
                ago + set + out + nov, data = dados)


# Mostrar os resultados da regressão nova via stargazer
stargazer(regress_3, type = "html", out = file.path(dir_output, "regress_3_tabela.html"),          
          title = "Resultados da Regressão com variáveis defasadas",
          align = TRUE)

save(regress_3, file = file.path(dir_tmp, "regressao_3.RData"))