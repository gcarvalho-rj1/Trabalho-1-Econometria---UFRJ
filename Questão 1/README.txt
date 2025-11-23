###############################################################
Trabalho de Econometria – Questão 1
IE/UFRJ – 2025.02
Professor: Vitor Pereira
###############################################################

Grupo: Mario Cesar (123674609), Guilherme (123671562) e Matheus (123443189)

Seed: [123674609]

Este arquivo se trata de um resumo do trabalho de econometria e contém as principais informações
separado por questão

###############################################################
Descrição do projeto - Questão 1
###############################################################


O objetivo é:

• gerar dados baseados na equação de Mincer;
• realizar análises descritivas pelo stargazer;
• produzir gráficos com ggplot2 e plotly;
• estimar modelos de regressão por OLS e FGLS;
• testar heterocedasticidade via White/Breusch-Pagan;
• comparar resultados entre erro homocedástico e heterocedástico.


###############################################################
Estrutura de Pastas
###############################################################
O diretório raiz contém 5 pastas:

1. code
   # scripts em R organizados pela ordem que deve ser executada
   # inclui o arquivo _master.R com os caminhos das pastas

2. input
   # contém apenas a base original gerada

3. tmp
   # contém arquivos temporários

4. output
   # contém resultados finais: tabelas, gráficos e etc

5. misc
   # materiais diversos não relacionados às pastas anteriores


###############################################################
Observações
###############################################################
• Decidimos incluir o coeficiente de variação (CV) no quadro de estatísticas descritivas.Ele mede a dispersão relativa das variáveis. Diferente do desvio-padrão absoluto, o CV compara a  variabilidade entre variáveis com escalas distintas. Para salários, por exemplo, o CV ajuda a avaliar a heterogeneidade salarial da amostra — quanto maior o CV, maior a desigualdade relativa dos ganhos.






