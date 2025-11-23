#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Função para automatizar a estimação do repasse cambial
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: dados
# output: function analisa_setor

load(file.path(dir_tmp, "base_inicial.RData"))

analisa_setor <- function(nome_setor) {
  df <- dados %>% transmute(
    setor = .data[[nome_setor]], cambio, ibcbr, fev, mar, abr, mai, jun, jul, ago, set, out, nov) %>%
    mutate(
      setor_lag  = lag(setor, 1), cambio_lag = lag(cambio, 1)) %>%
    drop_na()
  
  mod3 <- lm(setor ~ cambio + cambio_lag + ibcbr + setor_lag +
      fev + mar + abr + mai + jun + jul + ago + set + out + nov, data = df)
  
  mod3_hac <- coeftest(mod3, vcov = NeweyWest(mod3, lag = 12, prewhite = FALSE))
  
  repasse_total <- coef(mod3)["cambio"] + coef(mod3)["cambio_lag"]
  
  ljung <- Box.test(residuals(mod3), lag = 12, type = "Ljung-Box")
  bp <- bptest(mod3)
  
  list(setor = nome_setor,
       modelo=mod3,
       modelo_hac = mod3_hac,
       repasse_total = as.numeric(repasse_total),
       ljung_pvalue = ljung$p.value,
       bp_pvalue = bp$p.value)
}
