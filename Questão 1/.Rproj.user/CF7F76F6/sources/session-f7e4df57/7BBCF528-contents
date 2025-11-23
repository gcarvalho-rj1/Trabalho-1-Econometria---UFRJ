#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Calcular os resíduos da regressão e tirar o quadrado dos resíduos. Plotar um
# histograma dos resíduos.
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: regress_4, data
# output: histograma_residuos
#######################################################


# Carrega a regressão feita sobre as variáveis
load(file.path(dir_tmp, "regress_4.RData"))

# Carrega a base de dados
load(file.path(dir_input, "base_inicial.RData"))


# Calcula os resíduos e os resíduos^2
residuos <- regress_4$residuals
residuos2 <- residuos^2


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
ggsave(filename = file.path(dir_output, "histograma_residuos.png"),
       hist_residuos, width = 7, height = 5)
