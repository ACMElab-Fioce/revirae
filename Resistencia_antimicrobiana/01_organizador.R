library(tidyr)


dados <- read.csv("combined_amr_results.csv")

dados2 <- dados[, c("gene_name", "sample_name", "drug_class")]


dados_separados <- dados2 %>%
  separate_rows(drug_class, sep = ";")


write.csv(dados_separados, "drug_class.csv", row.names = FALSE, 
          fileEncoding = "UTF-8", sep = ";")

