#######################################################
# Projeto: Trabalho Econometria Questão 3
# Objetivo: Gera uma tabela com estatisticas descritivas da base de dados
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Dezembro de 2025
#######################################################

# input: dados
# output: Q3_1_descr_italia.html

# Carrega os dados que serão utilizados
load(file.path(dir_tmp, "base_inicial.RData"))

# Variaveis da base
vars_dados <- c(
  "answers_math_std", "answers_ital_std",
  "answers_math_pct", "answers_ital_pct",
  "female", "immigrants_broad",
  "dad_lowedu", "dad_midedu", "dad_highedu",
  "mom_unemp", "mom_housew", "mom_employed",
  "our_CHEAT_ital", "our_CHEAT_math",
  "clsize_snv", "clsize_hat",
  "grade", "area"
)

base_desc <- dados[, vars_dados]
stargazer::stargazer(
  base_desc,
  type   = "html",
  title  = "Estatísticas descritivas – Italia",
  out    = file.path(dir_output, "Q3_1_descr_italia.html"),
  digits = 3
)
