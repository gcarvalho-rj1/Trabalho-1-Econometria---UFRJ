#######################################################
# Projeto: Trabalho Econometria Questão 3
# Objetivo: Balanceamento através de regressão linear
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Dezembro de 2025
#######################################################

# input: dados
# output: 

# Carrega os dados que serão utilizados
load(file.path(dir_tmp, "base_inicial.RData"))

# Fazendo as regressões

reg_female <- lm(female ~ o_math, data = dados)
reg_imm <- lm(immigrants_broad ~ o_math, data = dados)
reg_dad_l <- lm(dad_lowedu ~ o_math, data = dados)
reg_dad_m <- lm(dad_midedu ~ o_math, data = dados)
reg_mom_u <- lm(mom_unemp ~ o_math, data = dados)

reg_female
reg_imm
reg_dad_l
reg_dad_m
reg_mom_u
