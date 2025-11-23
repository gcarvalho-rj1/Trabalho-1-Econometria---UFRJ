#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Reestimar a equação por FGLS
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025

# input: data, regress_4_hetero
# output: regress_fgls
#######################################################


# Carrega a base de dados
load(file.path(dir_input, "base_inicial.RData"))

# Carregando regress_4_hetero
load(file.path(dir_tmp, "regress_4_hetero.RData"))


# Obtendo resíduos e estimando sigma ao quadrado
sigma2_chapeu <- residuals(regress_4_hetero)^2

# Regressão FGLS (weights = 1/sigma2_chapeu)
regress_fgls <- lm(log_wage_hetero ~ education + experience + I(experience^2) +
    male + white + north + northeast + south + centerwest, data = data, weights = 1/sigma2_chapeu
)

# Salva as regressões
save(regress_fgls, regress_4_hetero, file = file.path(dir_tmp, "regress_fgls.RData"))
