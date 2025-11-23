
Trabalho de Econometria – Questão 2
IE/UFRJ – 2025.02
Professor: Vitor Pereira

Grupo: Mario Cesar (123674609), Guilherme (123671562) e Matheus (123443189)

Seed: [123674609]

Este arquivo contém um resumo do trabalho de econometria, detalhando as principais informações da Questão 2.

###############################################################
Descrição do Projeto - Questão 2
###############################################################

Objetivo:

- Estimar os efeitos de variáveis explicativas no salário.
- Estimar modelos de regressão por OLS e FGLS.
- Realizar a comparação entre modelos com erro homocedástico e erro heterocedástico.
- Implementar testes de heterocedasticidade utilizando White e Breusch-Pagan.
- Analisar a significância estatística dos coeficientes.

###############################################################
Estrutura de Pastas
###############################################################

O diretório raiz contém as seguintes pastas organizadas:

1. code
   - Scripts em R organizados pela ordem de execução.
   - Inclui o arquivo _master.R, que centraliza os caminhos das pastas e outras configurações importantes.

2. input
   - Contém os dados originais a serem utilizados no estudo.

3. tmp
   - Arquivos temporários gerados durante o processo de análise.

4. output
   - Resultados finais, incluindo tabelas de estimativas, gráficos, resultados de testes de heterocedasticidade e demais outputs relevantes.

5. misc
   - Materiais diversos, como notas de leitura ou referências bibliográficas.

###############################################################
Observações
###############################################################

- Coeficiente de Variação (CV): Decidimos manter a análise do coeficiente de variação como parte das estatísticas descritivas. O CV será usado para medir a dispersão relativa das variáveis e compará-las, especialmente no contexto de salário, ajudando a entender a heterogeneidade salarial da amostra. Quanto maior o CV, maior a desigualdade relativa no salário da amostra.

- Validação do modelo: Além dos testes de heterocedasticidade (White e Breusch-Pagan), iremos realizar a validação cruzada visando robustez nas estimativas.
