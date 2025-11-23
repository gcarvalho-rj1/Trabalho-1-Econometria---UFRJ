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
dir_principal <- "C:/Users/apdua/Desktop/Mario/Trabalho Econometria/Questão 2"

dir_code  <- file.path(dir_principal, "code")
dir_output   <- file.path(dir_principal, "output")
dir_input  <- file.path(dir_principal, "input")
dir_tmp <- file.path(dir_principal, "tmp")

setwd(dir_principal)

set.seed (123443189) 

# Carregar pacotes
library(dplyr)
library(ggplot2)
library(stargazer)
library(lmtest)
library(sandwich)
library(car)
library(plotly)
library(readxl)
library(purrr)
library(tidyr)
library(stringr)




#source("code/1_instala_pacotes.R")
source("code/2_gera_base.R")
source("code/3_regressao_1.R")
source("code/4_ljung_box.R")
source("code/5_regressao_dummies_sazonais.R")
source("code/6_ljung_box_2.R")
source("code/7_regressao_3.R")
source("code/8_testes_bp_ljungbox.R")
source("code/9_hac.R")
source("code/10_funcoes_setores.R")
source("code/11_roda_setores.R")
source("code/12_tabela_final.R")


