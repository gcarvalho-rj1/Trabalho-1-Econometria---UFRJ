#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Criar um scatterplot do salário contra educação em anos de estudo.
# Fazer uma regressão linear e plotar os valores preditos no gráfico
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: data
# output: scatter_wage_homo_education_pred
#######################################################


# Carrega a base de dados
load(file.path(dir_input, "base_inicial.RData"))


# Realiza a regressão do salário homoscedástico pela educação
regress_1 <- lm(wage_homo ~ education, data = data)

# Cria os valores preditos
data$wage_pred <- predict(regress_1)

# 3) Gráfico
ggplot(data, aes(x = education, y = wage_homo)) + geom_point(alpha = 0.6) +                         
  geom_line(aes(y = wage_pred), color = "red", size = 1.1) +                           
  labs(
    title = "Relação entre Salário (Homoscedástico) e Escolaridade",
    x = "Educação (anos)",
    y = "Salário",
    caption = "Linha vermelha: valores preditos pela regressão linear"
  ) +
  theme_minimal()


# Salva o gráfico
ggsave(filename = file.path(dir_output, "scatter_wage_homo_education_pred.png"), 
       width = 7, height = 5)
