#######################################################
# Projeto: Trabalho Econometria Questão 1
# Objetivo: Código MASTER que carrega todos os códigos feitos no trabalho 
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# Limpando Environment e configurações iniciais
rm(list = ls())
options(scipen = 10000)


# Diretórios do projeto
dir_principal <- "C:/Users/apdua/Desktop/Mario/Trabalho Econometria/Questão 1"

dir_code  <- file.path(dir_principal, "code")
dir_output   <- file.path(dir_principal, "output")
dir_input  <- file.path(dir_principal, "input")
dir_tmp <- file.path(dir_principal, "tmp")

setwd(dir_code)

set.seed (123443189) 


# Carregar pacotes
library(dplyr)
library(ggplot2)
library(stargazer)
library(lmtest)
library(sandwich)
library(car)
library(plotly)


### Roda os scripts do trabalho

#source("1_instala_pacotes.R")
source("2_gera_base_inicial.R")
source("3_estatisticas_descritivas.R")
source("4_scatterplot_wage_homo_education.R")
source("5_scatterplot_log(wage_homo)_education.R")
source("6_scatterplot_log(wage_homo)_experience.R")
source("7_lm_categorias.R")
source("8_resultado_regressoes.R")
source("9_grafico_3d_log(wage_homo).R")
source("10_hist_residuos.R")
source("11_lm_hetero_categorias.R")
source("12_resultado_regressoes_hetero.R")
source("13_grafico_3d_log(wage_hetero).R")
source("14_hist_residuos_hetero.R")
source("15_teste_white.R")
source("16_resultado_teste_white.R")
source("17_teste_white_hetero.R")
source("18_resultado_teste_white_hetero.R")
source("19_estima_FGLS.R")
source("20_resultado_ols_fgls.R")
source("21_gera_base_200.R")
source("22_resultado_ols_fgls_200.R")
