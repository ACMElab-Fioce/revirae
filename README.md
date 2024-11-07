# Análises para o projeto Revirae

1) Inicialmente utilizei a seguinte lógica para separar as colunas que estão com múltiplos valores (no exemplo "drug_class")

library(tidyr)
dados <- read.csv("combined_amr_results.csv")
dados2 <- dados[, c("gene_name", "sample_name", "drug_class")]

dados_separados <- dados2 %>%
  separate_rows(drug_class, sep = ";")
  
write.csv(dados_separados, "dados2.csv", row.names = FALSE, fileEncoding = "UTF-8", sep = ";")

2) No arquivo csv, a coluna "drug_class" fica com espaçamentos no primeiro caractere, utilizei a seguinte fórmula para remover:

=SE(ESQUERDA(A1;1)=" ";DIREITA(A1;NÚM.CARACT(A1)-1);A1)


