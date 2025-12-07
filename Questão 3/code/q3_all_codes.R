#Trabalho 1 Econometria - Vitor Pontual

#Guilherme Carvalho
#Mario Cesar
#Matheus 

#install libraries

if (!require(pacman)) install.packages("pacman")

pacman::p_load(
  readstata13, 
  dplyr,      
  stargazer,    
  AER,          
  sandwich, lmtest)

#cfg_settings:

setwd("C:/Users/gcarv/OneDrive/Área de Trabalho/econometria/Questão 3")
getwd()  
#libraries
library(ggplot2)
library(dplyr)
library(AER)
library(lmtest)
library(sandwich)
library(readstata13)
caminho_smallmo <- file.path("input", "smallmo.dta")
Maimonides_italia <- read.dta13(caminho_smallmo)


#Questão 3

str(Maimonides_italia)
names(Maimonides_italia)

vars_q31 <- c(
  "answers_math_std", "answers_ital_std",
  "answers_math_pct", "answers_ital_pct",
  "female", "immigrants_broad",
  "dad_lowedu", "dad_midedu", "dad_highedu",
  "mom_unemp", "mom_housew", "mom_employed",
  "our_CHEAT_ital", "our_CHEAT_math",
  "clsize_snv", "clsize_hat",
  "grade", "area"
)

base_desc <- Maimonides_italia[, vars_q31]
base_desc
stargazer::stargazer(
  base_desc,
  type   = "html",
  title  = "Estatísticas descritivas – Italia",
  out    = file.path("output", "Q3_1_descr_italia.html"),
  digits = 3
)

vars_q32 <- c(
  "answers_math_std",
  "answers_ital_std",
  "female",
  "immigrants_broad",
  "dad_lowedu",
  "dad_midedu",
  "mom_unemp",
  "answers_math_pct",
  "answers_ital_pct",
  "our_CHEAT_ital",
  "our_CHEAT_math"
)

medias_regiao_serie <- Maimonides_italia |>
  dplyr::group_by(area, grade) |>
  dplyr::summarise(
    dplyr::across(
      dplyr::all_of(vars_q32),
      ~ mean(.x, na.rm = TRUE),
      .names = "mean_{.col}"
    ),
    .groups = "drop"
  ) |>
  dplyr::mutate(
    dplyr::across(
      dplyr::starts_with("mean_"),
      ~ round(.x, 3)
    )
  )

stargazer::stargazer(
  medias_regiao_serie,
  type   = "html",
  title  = "Médias por região e série",
  out    = file.path("output", "Q3_2_medias_regiao_serie.html"),
  summary = FALSE
)

#3.4

t_female        <- t.test(female           ~ o_math, data = Maimonides_italia)
t_immigrants    <- t.test(immigrants_broad ~ o_math, data = Maimonides_italia)
t_dad_low       <- t.test(dad_lowedu       ~ o_math, data = Maimonides_italia)
t_dad_mid       <- t.test(dad_midedu       ~ o_math, data = Maimonides_italia)
t_mom_unemp     <- t.test(mom_unemp        ~ o_math, data = Maimonides_italia)
t_female

t_female
t_immigrants
t_dad_low
t_dad_mid
t_mom_unemp
t_female

#3.5

reg_female <- lm(female ~ o_math, data = Maimonides_italia)
reg_imm    <- lm(immigrants_broad ~ o_math, data = Maimonides_italia)
reg_dad_l  <- lm(dad_lowedu ~ o_math, data = Maimonides_italia)
reg_dad_m  <- lm(dad_midedu ~ o_math, data = Maimonides_italia)
reg_mom_u  <- lm(mom_unemp ~ o_math, data = Maimonides_italia)

reg_female
reg_imm
reg_dad_l
reg_dad_m
reg_mom_u

names(Maimonides_italia)

cl_vcov <- function(mod) sandwich::vcovCL(mod, cluster = ~ clu)

coeftest(reg_female, vcov = cl_vcov(reg_female))
coeftest(reg_imm, vcov = cl_vcov(reg_imm))
coeftest(reg_dad_l, vcov = cl_vcov(reg_dad_l))
coeftest(reg_dad_m, vcov = cl_vcov(reg_dad_m))
coeftest(reg_mom_u, vcov = cl_vcov(reg_mom_u))


stargazer::stargazer(
  reg_female, reg_imm, reg_dad_l, reg_dad_m, reg_mom_u,
  type          = "html",
  title         = "Balanceamento por regressão – amostra total",
  dep.var.labels = "Variável dependente",
  out           = file.path("output", "Q3_5_balanceamento_total.html"),
  digits        = 3
)


stargazer(reg_female, type = "text")
stargazer(reg_imm,    type = "text")
stargazer(reg_dad_l,  type = "text")
stargazer(reg_dad_m,  type = "text")
stargazer(reg_mom_u,  type = "text")

#3.5b

names(Maimonides_italia)

# Norte
reg_n_mom_un <- lm(mom_unemp ~ o_math, 
data = dplyr::filter(Maimonides_italia, north == 1))

# Centro
reg_c_mom_un <- lm(mom_unemp ~ o_math, 
data = dplyr::filter(Maimonides_italia, centre == 1))

# Sul
reg_s_mom_un <- lm(mom_unemp ~ o_math, 
data = dplyr::filter(Maimonides_italia, south == 1))

reg_s_mom_un
reg_c_mom_un
reg_n_mom_un

stargazer::stargazer(
  reg_n_mom_un, reg_c_mom_un, reg_s_mom_un,
  type          = "html",
  title         = "Balanceamento de mom_unemp por região",
  column.labels = c("Norte", "Centro", "Sul"),
  out           = file.path("output", "Q3_5_balanceamento_mom_unemp_regioes.html"),
  digits        = 3
)


#3.6

reg_cheat_math <- lm(our_CHEAT_math ~ o_math, data = Maimonides_italia)
reg_cheat_ital <- lm(our_CHEAT_ital ~ o_math, data = Maimonides_italia)

reg_score_math_std  <- lm(answers_math_std  ~ o_math, data = Maimonides_italia)
reg_score_ital_std  <- lm(answers_ital_std  ~ o_math, data = Maimonides_italia)
reg_score_math_pct  <- lm(answers_math_pct ~ o_math, data = Maimonides_italia)
reg_score_ital_pct  <- lm(answers_ital_pct ~ o_math, data = Maimonides_italia)



controles <- c("female", "immigrants_broad",
               "dad_lowedu", "dad_midedu", "mom_unemp",
               "grade", "area")

form_cheat_math <- as.formula(
  paste("our_CHEAT_math ~ o_math +", paste(controles, collapse = " + "))
)

reg_cheat_math_ctrl <- lm(form_cheat_math, data = Maimonides_italia)

stargazer::stargazer(
  reg_cheat_math, reg_cheat_ital,
  reg_score_math_std, reg_score_ital_std,
  type   = "html",
  title  = "Impacto do monitoramento sobre fraude e notas",
  out    = file.path("output", "Q3_6_impacto_monitoramento.html"),
  digits = 3
)

#3.6 - fraudes

reg_cheat_regioes <- lm(
  our_CHEAT_math ~ north + centre + south,
  data = Maimonides_italia)

stargazer::stargazer(
  reg_cheat_regioes,
  type   = "html",
  title  = "Fraude em matemática por região",
  out    = file.path("output", "Q3_7_fraude_regioes.html"),
  digits = 3
)

Maimonides_italia <- Maimonides_italia |>
  dplyr::mutate(
    sul = ifelse(area == "Sul" | south == 1, 1, 0))

reg_notas_interacao <- lm(
  answers_math_std ~ our_CHEAT_math * sul,
  data = Maimonides_italia)

summary(reg_notas_interacao)

stargazer::stargazer(
  reg_notas_interacao,
  type = "html",
  title = "Impacto da manipulação de notas em matemática por região (Sul x demais)",
  dep.var.labels = "Nota padronizada de matemática",
  digits = 3,
  out = file.path("output", "Q3_7_notas_interacao_sul.html")
)


#3.10

base_classe <- Maimonides_italia |>
  group_by(schoolid, classid) |>
  summarise(
    mean_math = mean(answers_math_std, na.rm = TRUE),
    clsize_snv = first(clsize_snv),
    clsize_hat = first(clsize_hat),
    .groups = "drop"
  )

base_bins <- base_classe |>
  mutate(bin = cut(clsize_snv, breaks = seq(10, 30, 1))) |>
  group_by(bin) |>
  summarise(
    mean_x = mean(clsize_snv),
    mean_y = mean(mean_math)
  )

ggplot() +
  geom_point(data = base_bins, aes(mean_x, mean_y), size = 2) +
  geom_vline(xintercept = 25, linetype = "dashed") +
  geom_smooth(
    data = subset(base_classe, clsize_snv <= 25),
    aes(clsize_snv, mean_math),
    method = "lm", se = FALSE
  )+
  geom_smooth(
    data = subset(base_classe, clsize_snv > 25),
    aes(clsize_snv, mean_math),
    method = "lm", se = FALSE
  )+
  labs(
    x = "Tamanho da turma observado (clsize_snv)",
    y = "Nota média padronizada em matemática",
    title = "RDD simples: nota média x tamanho observado da turma")+
    coord_cartesian(ylim = c(-0.01, 0.23))
ggsave(
  filename = "Q3_10_rdd_simples.png", 
  path     = "output",               
  width    = 8, height = 5, dpi      = 300)

#3.11

cutoff <- 25
bw     <- 5

base_local_hat <- base_classe |>
  dplyr::filter(clsize_hat >= cutoff - bw,
                clsize_hat <= cutoff + bw)

base_bins_hat <- base_local_hat |>
  dplyr::mutate(
    bin = cut(clsize_hat,
              breaks = seq(cutoff - bw, cutoff + bw, by = 0.5))
  ) |>
  dplyr::group_by(bin) |>
  dplyr::summarise(
    mean_x = mean(clsize_hat),
    mean_y = mean(mean_math),
    .groups = "drop"
  )
base_local_hat
base_bins_hat

ggplot(base_bins_hat, aes(x = mean_x, y = mean_y)) +
  geom_point() +
  geom_vline(xintercept = cutoff, linetype = "dashed") +
  geom_smooth(
    data = subset(base_bins_hat, mean_x <= cutoff),
    method = "lm", se = FALSE
  ) +
  geom_smooth(
    data = subset(base_bins_hat, mean_x > cutoff),
    method = "lm", se = FALSE
  ) +
  labs(
    x = "Tamanho predito da turma (clsize_hat)",
    y = "Nota média padronizada em matemática",
    title = "RDD simples: nota média x tamanho predito da turma"
  ) +
  coord_cartesian(ylim = c(-0.03, 0.08))
ggsave(
  filename = "Q3_11_rdd_simples.png", 
  path     = "output",               
  width    = 8, height = 5, dpi      = 300)

#3.12

controles_iv <- c(
  "female", "immigrants_broad",
  "dad_lowedu", "dad_midedu", "dad_highedu",
  "mom_unemp", "mom_housew", "mom_employed",
  "grade", "area"
)

formula_iv_1 <- as.formula(
  paste0(
    "answers_math_std ~ clsize_snv + ",
    paste(controles_iv, collapse = " + "),
    " | clsize_hat + ",
    paste(controles_iv, collapse = " + ")
  )
)

reg_maimonides <- ivreg(
  formula_iv_1,
  data = Maimonides_italia
  # , cluster = "clu"  # se você estiver usando essa sintaxe
)

summary(reg_maimonides)


#3.16

formula_iv_2 <- as.formula(
  paste0(
    "answers_math_std ~ clsize_snv + our_CHEAT_math + ",
    paste(controles_iv, collapse = " + "),
    " | clsize_hat + o_math + ",
    paste(controles_iv, collapse = " + ")
  )
)

reg_maimonides2 <- ivreg(
  formula_iv_2,
  data = Maimonides_italia, cluster = "clu"
)

summary(reg_maimonides2)

stargazer::stargazer(
  reg_maimonides, reg_maimonides2,
  type  = "html",
  title = "Efeito do tamanho da turma – IV simples vs IV com manipulação",
  column.labels = c("IV: só tamanho", "IV: tamanho + fraude"),
  dep.var.labels = "Nota padronizada de matemática",
  out   = file.path("output", "Q3_16_iv_maimonides.html"),
  digits = 3
)


