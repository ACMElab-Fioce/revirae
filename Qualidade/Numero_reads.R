library(ggplot2)
library(scales)

reads <- read.csv("samples_overview.csv", se=";")

reads$samples <- sub("^(.*?IP).*", "\\1", reads$sample_name)

grafico <- ggplot(reads, aes(x = samples)) +
  geom_bar(aes(y = total_reads, fill = "Total de Reads"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = passed_filters, fill = "Reads pós filtro"), stat = "identity", position = "dodge") +
  labs(x = "Amostra", y = "Número de reads", fill = "Legenda:") +
  scale_y_continuous(labels = label_number(scale = 1e-6, suffix = "M")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 4)) +
  ggtitle("Total e pós-filtragem de Reads por amostra")

ggsave("Reads_novo.jpg", plot = grafico, width = 10, height = 6, dpi = 600)