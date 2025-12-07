#######################################################
# Projeto: Trabalho Econometria Questão 3
# Objetivo: Gera as médias das variaveis selecionadas, por região italiana e série
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Dezembro de 2025
#######################################################

# input: dados
# output: Q3_2_medias_regiao_serie.html

# Carrega os dados que serão utilizados
load(file.path(dir_tmp, "base_inicial.RData"))

# variaveis selecionadas
vars_selec <- c("answers_math_std", "answers_ital_std", "female", "immigrants_broad", "dad_lowedu", "dad_midedu",
  "mom_unemp", "answers_math_pct", "answers_ital_pct", "our_CHEAT_ital", "our_CHEAT_math")

# medias
medias_regiao_serie <- dados %>% group_by(area, grade) %>% 
  summarise(across(all_of(vars_selec), ~ mean(.x, na.rm = TRUE),
      .names = "mean_{.col}"), .groups = "drop"
)

stargazer(medias_regiao_serie, type   = "html",
  title  = "Médias por região (area) e série (grade)",
  out    = file.path(dir_output, "Q3_2_medias_regiao_serie.html"), summary = FALSE,
  digits = 3
)
