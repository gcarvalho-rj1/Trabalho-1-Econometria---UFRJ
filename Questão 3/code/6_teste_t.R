#######################################################
# Projeto: Trabalho Econometria Questão 3
# Objetivo: Teste t para algumas características  
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Dezembro de 2025
#######################################################

# input: dados
# output: 

# Carrega os dados que serão utilizados
load(file.path(dir_tmp, "base_inicial.RData"))

# Calculando os testes t

t_female <- t.test(female ~ o_math, data = dados)
t_immigrants <- t.test(immigrants_broad ~ o_math, data = dados)
t_dad_low <- t.test(dad_lowedu ~ o_math, data = dados)
t_dad_mid <- t.test(dad_midedu ~ o_math, data = dados)
t_mom_unemp<- t.test(mom_unemp ~ o_math, data = dados)

t_female
t_immigrants
t_dad_low
t_dad_mid
t_mom_unemp
t_female