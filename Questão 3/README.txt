Trabalho de Econometria – Questão 3
IE/UFRJ – 2025.02
Professor: Vitor Pereira

Grupo: Mario Cesar (123674609), Guilherme (123671562) e Matheus (123443189)

Seed: [123674609]

Este arquivo contém um resumo do trabalho de econometria, detalhando as principais informações da Questão 3.

###############################################################
Descrição do Projeto - Questão 3
###############################################################

Objetivo:

Utilizar a base smallmo.dta para analisar o impacto do monitoramento e do tamanho da turma sobre o desempenho dos alunos italianos.

Verificar o balanceamento entre turmas com e sem fiscal por meio de estatísticas descritivas, testes t e regressões.

Investigar a relação entre monitoramento, suspeita de manipulação das notas (our_CHEAT_math/our_CHEAT_ital) e desempenho em matemática e italiano.

Explorar a “regra de Maimônides” italiana como fonte de variação quase-exógena no tamanho de turma, por meio de gráficos de descontinuidade (RDD) usando o tamanho observado (clsize_snv) e o tamanho predito (clsize_hat).

Estimar modelos com variáveis instrumentais (IV), utilizando clsize_hat e o sorteio do monitoramento (o_math) como instrumentos para o tamanho da turma e a fraude, identificando o efeito causal de turmas menores e da manipulação sobre as notas.

Comparar as especificações estruturais (com e sem a variável de fraude endógena) e discutir como a presença de manipulação enviesava as estimativas do impacto do tamanho da turma.

###############################################################
Estrutura de Pastas
###############################################################

O diretório raiz contém as seguintes pastas organizadas:

code

Scripts em R organizados pela ordem de execução da Questão 3.

Inclui o arquivo _master.R, que centraliza os caminhos das pastas, o carregamento da base smallmo.dta e as funções auxiliares (cálculo de médias, testes t, regressões, IV, geração de gráficos RDD e tabelas em stargazer).

input

Contém os dados originais fornecidos pelo professor, incluindo o arquivo smallmo.dta e o dicionário de variáveis da base italiana.

output

Resultados finais da Questão 3, incluindo:

Tabelas de estatísticas descritivas e de balanceamento (testes t e regressões).

Estimativas dos modelos OLS e IV (com e sem fraude).

Gráficos de RDD com clsize_snv e clsize_hat.

Arquivos HTML gerados via stargazer com as regressões principais.
