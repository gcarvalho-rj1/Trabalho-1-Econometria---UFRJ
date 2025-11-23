#######################################################
# Projeto: Trabalho Econometria Questão 2
# Objetivo: Calcula a tabela final com o resultados dos setores
# Responsáveis: Mario (123674609), Guilherme (123671562) e Matheus (123443189)
# Data do projeto: Novembro de 2025
#######################################################

# input: resultados_setores
# output: resumo_setores

resultados_setores <- readRDS("tmp/resultados_setores.rds")

resumo_setores <- map_dfr(resultados_setores, ~ tibble(
    setor         = .x$setor,
    repasse_total = .x$repasse_total,
    ljung_p       = .x$ljung_pvalue,
    bp_p          = .x$bp_pvalue))

resumo_setores <- resumo_setores %>% arrange(desc(repasse_total))

write.csv(resumo_setores, "output/resumo_setores.csv", row.names = FALSE)

stargazer(resumo_setores, type = "html", summary = FALSE, out = "output/resumo_setores.html")
