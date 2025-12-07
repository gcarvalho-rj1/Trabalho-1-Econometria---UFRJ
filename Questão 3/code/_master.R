#######################################################
# Projeto: Trabalho Econometria Questão 3
# Objetivo: Código MASTER que carrega todos os códigos feitos no trabalho 
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Dezembro de 2025
#######################################################

# Limpando Environment e configurações iniciais
rm(list = ls())
options(scipen = 10000)


# Diretórios do projeto
dir_principal <- "C:/Users/apdua/Desktop/Mario/Trabalho Econometria/Questão 3"

dir_code  <- file.path(dir_principal, "code")
dir_output   <- file.path(dir_principal, "output")
dir_input  <- file.path(dir_principal, "input")
dir_tmp <- file.path(dir_principal, "tmp")

setwd(dir_principal)

set.seed (123443189) 

# Carregar pacotes
library(ggplot2)
library(lmtest)
library(sandwich)
library(car)
library(plotly)
library(readxl)
library(purrr)
library(tidyr)
library(stringr)

library(pacman)
library(stargazer)
library(dplyr)



source("code/1_instala_pacotes.R")
source("code/2_gera_base.R")
source("code/3_estats_descritivas.R")
source("code/4_medias_variaveis.R")
source("code/6_teste_t.R")
source("code/7_balanceamento_regressao.R")

