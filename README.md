# Análises para o projeto Revirae

1) Inicialmente utilizei o script "organizador.R" para separar as colunas que estão com múltiplos valores (no exemplo "drug_class")

2) No arquivo csv, a coluna "drug_class" fica com espaçamentos no primeiro caractere, utilizei a seguinte fórmula para remover:

=SE(ESQUERDA(A1;1)=" ";DIREITA(A1;NÚM.CARACT(A1)-1);A1)

3) Utilizei o script "Graficos_por_especie_patogenica.R" para gerar os gráficos de barra por amostra.
   
5) Utilizei o script "heatmap.ipynb" para gerar o dendograma


