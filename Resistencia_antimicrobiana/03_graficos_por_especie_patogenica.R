#Gráfico de proporção - amostras juntas
library(ggplot2)
library(patchwork)
library(scales)
library(dplyr)

new_dataset <- read.csv("drug_class.csv", sep=";")
new_dataset <- subset(new_dataset, time == "2024-09")
new_dataset <- subset(new_dataset, protocol == "UPIP")
#new_dataset <- subset(new_dataset, existe_painel == "SIM")
#new_dataset <- subset(new_dataset, estado != "NTC")

CE <- subset(new_dataset, state == "CE")
SP <- subset(new_dataset, state == "SP")
DF <- subset(new_dataset, state == "DF")
MG <- subset(new_dataset, state == "MG")
PE <- subset(new_dataset, state == "PE")
PR <- subset(new_dataset, state == "PR")


#-------------------------------------------------------------------------------
grafico <- ggplot(new_dataset, aes(x = pathogen_species, y = reads, 
                                   fill = pathogen_species)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ name2) +
  labs(x = "", y = "Número de reads", fill = "Legenda", 
       title = "Análise por amostras (Set-2024) - UPIP") + 
  scale_y_continuous(labels = label_number(scale = 1e-6, suffix = "M")) +
  scale_fill_manual(values = c(
    "Acinetobacter baumannii" = "#7f2524",   
    "Aeromonas hydrophila" = "#C70039",         
    "Enterococcus faecalis" = "#FF5733",       
    "Enterococcus faecium" = "#f17500",        
    "Escherichia coli" = "#ff9c3e",            
    "Klebsiella oxytoca" = "#6DC730",         
    "Klebsiella pneumoniae" = "#5dcca7",      
    "Pseudomonas aeruginosa" = "#39A69C",    
    "Salmonella enterica" = "#b4dfff",        
    "Streptococcus agalactiae" = "#efbbff",   
    "Streptococcus anginosus" = "#d896ff",    
    "Streptococcus pneumoniae" = "#9B59B6",    
    "Streptococcus pyogenes" = "#800080",     
    "Aeromonas caviae" = "#7d0013",           
    "Aeromonas veronii" = "#6b0046",          
    "Delftia acidovorans" = "#8f005e",        
    "Eikenella corrodens" = "#b20076",        
    "Moraxella osloensis" = "#e50098",        
    "Pseudomonas fluorescens" = "#d97f8d",    
    "Streptococcus dysgalactiae" = "#c23249",  
    "Streptococcus mitis" = "#a10019"         
  )) +
  theme_minimal() +
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_text(size = 18),
    strip.text = element_text(size = 18), 
    legend.text = element_text(size = 18),  
    legend.title = element_text(size = 18),   
    plot.title = element_text(size = 20, face = "bold"),  
    axis.title.y = element_text(size = 18),  
    panel.border = element_rect(color = "black", size = 1.5, fill = NA), 
    panel.background = element_blank(),
    legend.justification = c("center", "top"))



ggsave("dados_gerais_UPIP.jpg", plot = grafico, width = 24, height = 12, dpi = 600)

#-------------------------------------------------------------------------------
#Análises por amostra
new_dataset <- read.csv("pathogen_number_state_origin.csv", sep=";")

CE <- subset(new_dataset, state == "CE")
SP <- subset(new_dataset, state == "SP")
DF <- subset(new_dataset, state == "DF")
MG <- subset(new_dataset, state == "MG")
PE <- subset(new_dataset, state == "PE")
PR <- subset(new_dataset, state == "PR")

max_values <- PR %>%
  group_by(origin) %>%
  summarize(max_y = max(number))

grafico <- ggplot(PR, aes(x = pathogen_species, y = number, 
                          fill = pathogen_species)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ origin) +
  labs(x = "", y = "Número de amostras", fill = "Legenda", title = "Paraná") + 
  scale_y_continuous(breaks = seq(0, max(PR$number), by = 1)) + # Define a escala do eixo Y de 1 em 1
  scale_fill_manual(values = c(
    "Acinetobacter baumannii" = "#7f2524",   
    "Aeromonas hydrophila" = "#C70039",         
    "Enterococcus faecalis" = "#FF5733",       
    "Enterococcus faecium" = "#f17500",        
    "Escherichia coli" = "#ff9c3e",            
    "Klebsiella oxytoca" = "#6DC730",         
    "Klebsiella pneumoniae" = "#5dcca7",      
    "Pseudomonas aeruginosa" = "#39A69C",    
    "Salmonella enterica" = "#b4dfff",        
    "Streptococcus agalactiae" = "#efbbff",   
    "Streptococcus anginosus" = "#d896ff",    
    "Streptococcus pneumoniae" = "#9B59B6",    
    "Streptococcus pyogenes" = "#800080",     
    "Aeromonas caviae" = "#7d0013",           
    "Aeromonas veronii" = "#6b0046",          
    "Delftia acidovorans" = "#8f005e",        
    "Eikenella corrodens" = "#b20076",        
    "Moraxella osloensis" = "#e50098",        
    "Pseudomonas fluorescens" = "#d97f8d",    
    "Streptococcus dysgalactiae" = "#c23249",  
    "Streptococcus mitis" = "#a10019"
  )) +
  geom_hline(data = max_values, aes(yintercept = max_y), linetype = "dashed", color = "red") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = -45, hjust = 0, size = 11), 
    strip.text = element_text(size = 18), 
    panel.border = element_rect(color = "black", size = 1.5, fill = NA), 
    panel.background = element_blank(),
    legend.justification = c("center", "top")
  )
  
  
ggsave("./definitiveoutput/PR_state_origin_number.jpg", 
       plot = grafico, width = 15, height = 8, dpi = 600)  
  
  
  
  
  

