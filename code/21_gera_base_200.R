#######################################################
# Projeto: Trabalho Econometria - Questão 1
# Objetivo: Gera a base de dados para 200.000 observações
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: 
# output: data_200
#######################################################


# ===============================================================
# EXERCÍCIO DE ECONOMETRIA : ANÁLISE DO MERCADO DE TRABALHO BRASILEIRO
# Equação de Mincer para Retornos à Educação
# ================================================================


# ================================================================
# PARTE 1: GERAÇÃO DOS DADOS
# ================================================================

# Tamanho da amostra
n <- 200000

# Gera variáveis demográficas
data_200 <- data.frame(
  # Educação: anos de estudo (4 a 18 anos , médiaâ9.5)
  education = pmax (4, pmin (18 , round ( rnorm (n, mean = 9.5 , sd = 3.5) ))),
  
  # Sexo : 1 = masculino , 0 = feminino (52% homens )
  male = rbinom (n, 1, 0.52) ,
  
  # Raça: 1 = branco , 0 = preto / pardo (45% brancos no Brasil )
  white = rbinom (n, 1, 0.45) ,
  
  # Experiência : anos de experiência no trabalho (0 a 45 anos )
  experience = pmax (0, pmin (45 , round ( rnorm (n, mean = 15, sd = 10))))
)

# Gera regiões ( distribuição populacional aproximada do Brasil )
regions <- c(" North ", " Northeast ", " Southeast ", " South ", " CenterWest ")
region_probs <- c (0.09 , 0.27 , 0.42 , 0.14 , 0.08) # Distribuição populacional aproximada
data_200$region <- sample ( regions , n, replace = TRUE , prob = region_probs )

# Cria variáveis dummies para regi ões ( Sudeste como referência )
data_200$north <- ifelse ( data_200$region == " North ", 1, 0)
data_200$northeast <- ifelse ( data_200$region == " Northeast ", 1, 0)
data_200$south <- ifelse ( data_200$region == " South ", 1, 0)
data_200$centerwest <- ifelse ( data_200$region == " CenterWest ", 1, 0)

# ================================================================
# PARTE 2: GERAÇÃO DE SALÁRIOS - ERROS HOMOCEDÁSTICOS
# ================================================================

# Parâ metros da equação de Mincer ( baseado na literatura brasileira )
beta_0 <- 6.8 # Intercepto (log do salário baseâR$ 900)
beta_edu <- 0.13 # Retorno à educação (13% por ano de estudo )
beta_male <- 0.25 # Prêmio masculino (25%)
beta_white <- 0.18 # Prêmio para brancos (18%)
beta_exp <- 0.035 # Retorno da experiência (3.5% ao ano )
beta_exp2 <- -0.0005 # Experiência ao quadrado ( retornos decrescentes )

# Efeitos regionais ( Sudeste como referência )
beta_north <- -0.15 # Penalidade Norte
beta_northeast <- -0.20 # Penalidade Nordeste ( maior efeito )
beta_south <- 0.08 # Prêmio Sul
beta_centerwest <- 0.05 # Pequeno prêmio Centro-Oeste

# Gera salários logaritmizados com erros HOMOCEDÁSTICOS
data_200$log_wage_homo <- beta_0 +
  beta_edu * data_200$education +
  beta_male * data_200$male +
  beta_white * data_200$white +
  beta_exp * data_200$experience +
  beta_exp2 * data_200$experience ^2 +
  beta_north * data_200$north +
  beta_northeast * data_200$northeast +
  beta_south * data_200$south +
  beta_centerwest * data_200$centerwest +
  rnorm (n, mean = 0, sd = 0.35) # Erros homocedásticos

# Converte para níveis (salários em Reais )
data_200$wage_homo <- exp( data_200$log_wage_homo )

# ================================================================
# PARTE 3: GERAçÃO DE SALÁRIOS - ERROS HETEROCEDÁSTICOS
# ================================================================

# Variância dos erros heterocedásticos como função de educação e experiência
# Trabalhadores mais educados e experientes têm maior variância salarial
error_variance <- 0.25 + 0.015 * data_200$education + 0.005 * data_200$experience

# Gera erros heterocedásticos
hetero_errors <- rnorm (n, mean = 0, sd = sqrt ( error_variance ))

# Gera salários logaritmizados com erros HETEROCEDÁSTICOS
data_200$log_wage_hetero <- beta_0 +
  beta_edu * data_200$education +
  beta_male * data_200$male +
  beta_white * data_200$white +
  beta_exp * data_200$experience +
  beta_exp2 * data_200$experience ^2 +
  beta_north * data_200$north +
  beta_northeast * data_200$northeast +
  beta_south * data_200$south +
  beta_centerwest * data_200$centerwest +
  hetero_errors # Erros heterocedásticos

# Converte para níveis
data_200$wage_hetero <- exp( data_200$log_wage_hetero )


# Salva o output na pasta
save(data_200, file = file.path(dir_tmp, "base_inicial_200.RData"))
