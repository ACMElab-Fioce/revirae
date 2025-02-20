# Análises para o Projeto Revirae  

Este repositório contém scripts e instruções para análises de resistência antimicrobiana no âmbito do Projeto Revirae.  

## Objetivo  
Realizar análises para identificar padrões de resistência antimicrobiana em amostras, utilizando dados do CZID e gerando visualizações como dendogramas e gráficos de barra.  

## Requisitos  
Certifique-se de ter os seguintes itens instalados antes de executar os scripts:  
- **R** (com os pacotes necessários especificados nos scripts `.R`)  
- **Python 3** (com Jupyter Notebook e bibliotecas como `pandas`, `seaborn`, entre outras)  
- Editor de planilhas (como Excel ou Google Sheets)  

---

## Instruções 

## 1.Análises de Qualidade
### Passo 1: Download do Arquivo
Faça o download do arquivo `Sample Overview (sample QC metrics)` a partir do **CZID**.

### Passo 2: Execute o arquivo Numero_reads.R
Será gerado como resultado um gráfico com o número total de reads e o número que passou pelo filtro de qualidade.

---

## 2.Organismos detectados
### Passo 1: Download do Arquivo 
Faça o download do arquivo `Combined Sample Taxon Results (NT r total reads)` a partir do **CZID**.

### Passo 2: Execute o arquivo 01_top-generation.R com as devidas alterações
Ao final da execução, será gerado o arquivo `new_output.csv`, utilizado nas próximas etapas.

### Passo 3: Execute o arquivo 02_pieplot_relatorio.R com as devidas alterações
Ao final da execução, serão gerados gráficos para cada uma das amostras analisadas.

### Passo 4: Edições no Arquivo
Faça as alterações necessárias no arquivo `new_output.csv` para incluir informações de tempo, estado, local, protocolo...

### Passo 5: Execute o arquivo 03_graficos_por_especie_patogenica.R com as devidas alterações


---

## 3.Análises de Resistência Antiicrobiana  
### Passo 1: Download do Arquivo  
Faça o download do arquivo `combined_amr_results.csv` a partir do **CZID**.

### Passo 2: Organização das Colunas  
Use o script `01_organizador.R` para reorganizar as colunas que contêm múltiplos valores, gerando como resultado o arquivo **`drug_class.csv`**.  

### Passo 3: Edições no Arquivo
Faça as alterações necessárias no arquivo `drug_class.csv` para incluir informações de tempo, estado, local, protocolo...
O arquivo pode conter espaçamentos desnecessários no início de alguns valores. Utilize a fórmula abaixo em seu editor de planilhas para corrigir:  
```excel  
=SE(ESQUERDA(A1;1)=" ";DIREITA(A1;NÚM.CARACT(A1)-1);A1)  
```  
Certifique-se de salvar o arquivo corrigido para as etapas seguintes.  




### Passo 4: Geração do Dendrograma  
Execute o script `02_heatmap.ipynb` para criar o dendrograma com base nos dados processados.  
- **Entrada**: Arquivo CSV ajustado.  
- **Saída**: Dendrograma visualizando os padrões de resistência.  

### Passo 5: Criação de Gráficos de Barra  
Utilize o script `03_graficos_por_especie_patogenica.R` para gerar gráficos de barra agrupados por amostra e espécie patogênica.  
- **Entrada**: Arquivo processado na etapa anterior.  
- **Saída**: Gráficos detalhados por espécie patogênica.  

---

## Estrutura do Repositório  

```plaintext  
|-- 01_organizador.R          # Script para organizar colunas com múltiplos valores.  
|-- 02_heatmap.ipynb          # Notebook para gerar o dendrograma.  
|-- 03_graficos_por_especie_patogenica.R  # Script para criar gráficos de barra.  
|-- combined_amr_results.csv  # Arquivo de entrada (não incluso, baixe do CZID).  
```  

---


   


