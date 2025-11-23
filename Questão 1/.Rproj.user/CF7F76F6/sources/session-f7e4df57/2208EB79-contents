#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Calcular os resíduos da regressão (utilizando log wage hetero) e tirar o quadrado dos resíduos. Plotar um
# histograma dos resíduos. 
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: regress_4_hetero, data
# output: histograma_residuos_hetero
#######################################################

# Carrega a regressão feita sobre as variáveis
load("C:/Users/apdua/Desktop/Mario/Trabalho Econometria/Questão 1/tmp/regress_4_hetero.RData")

# Carrega a base de dados
load("C:/Users/apdua/Desktop/Mario/Trabalho Econometria/Questão 1/input/base_inicial.RData")


# Calcula os resíduos e os resíduos^2
data$residuos <- resid(regress_4_hetero)
data$residuos2 <- data$residuos^2


# Histograma dos resíduos
hist_residuos <- ggplot(data, aes(x = residuos)) +
  geom_histogram(
    bins = 30,
    fill = "steelblue",
    color = "white",
    alpha = 0.8
  ) +
  labs(
    title = "Histograma dos Resíduos da Regressão",
    x = "Resíduos",
    y = "Frequência"
  ) +
  theme_minimal()

# Salva o histograma
ggsave(filename = file.path(dir_output, "histograma_residuos_hetero.png"),
       hist_residuos, width = 7, height = 5)
