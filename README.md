<div align="center">

<img src="https://img.shields.io/badge/NaraHoteis-Consultoria%20de%20Dados-2D5A27?style=for-the-badge&logoColor=white" />

# 🏨 NaraHoteis — Consultoria de Dados

### Diagnóstico e Painel Gerencial | Projeto Final UC2 — Analista de Dados

</div>

---

## 📋 Sobre o Projeto

A **NaraHoteis** é uma rede hoteleira com **12 unidades distribuídas em 4 regiões do estado do Rio de Janeiro**. A diretoria identificou queda de receita em algumas unidades e contratou uma consultoria de dados para:

- Auditar e tratar bases de dados exportadas de um sistema legado
- Realizar análise estatística completa da operação
- Construir painéis visuais para apoio à tomada de decisão
- Estruturar um banco de dados relacional
- Entregar um relatório gerencial no Power BI

> Este projeto simula um ambiente real de consultoria — sem roteiro de código, sem indicação dos problemas nas bases. O time identifica, trata, analisa e entrega.

---

## 🗺️ Regiões e Unidades

| Região | Unidades |
|---|---|
| Capital | Ipanema · Barra da Tijuca · Centro · Santa Teresa |
| Baixada Fluminense | Nova Iguaçu Centro · Nova Iguaçu Park |
| Serra | Petrópolis · Teresópolis · Friburgo |
| Costa Verde | Paraty · Angra dos Reis · Mangaratiba |

---

## 🛠️ Tecnologias Utilizadas

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557C?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

</div>

---

## 📚 Conhecimentos Aplicados

<div align="center">

![Pré-processamento](https://img.shields.io/badge/Pré--processamento%20de%20Dados-2D5A27?style=for-the-badge&logoColor=white)
![Estatística Descritiva](https://img.shields.io/badge/Estatística%20Descritiva-4A7C3F?style=for-the-badge&logoColor=white)
![Análise de Outliers](https://img.shields.io/badge/Análise%20de%20Outliers-2D5A27?style=for-the-badge&logoColor=white)
![Correlação de Pearson](https://img.shields.io/badge/Correlação%20de%20Pearson-4A7C3F?style=for-the-badge&logoColor=white)
![Regressão Linear](https://img.shields.io/badge/Regressão%20Linear-2D5A27?style=for-the-badge&logoColor=white)
![Modelagem Relacional](https://img.shields.io/badge/Modelagem%20Relacional-4A7C3F?style=for-the-badge&logoColor=white)
![Visualização de Dados](https://img.shields.io/badge/Visualização%20de%20Dados-2D5A27?style=for-the-badge&logoColor=white)
![DAX](https://img.shields.io/badge/DAX%20Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

</div>

---

## 📁 Estrutura do Repositório

```
narahoteis-consultoria/
│
├── dados/
│   ├── brutos/                  # CSVs originais (com inconsistências)
│   │   ├── reservas.csv
│   │   ├── unidades.csv
│   │   ├── tipos_quarto.csv
│   │   ├── clientes.csv
│   │   ├── canais_venda.csv
│   │   └── funcionarios.csv
│   │
│   └── tratados/                # CSVs limpos exportados após tratamento
│
├── notebook/
│   └── narahoteis_analise.ipynb # Pré-processamento → Estatística → Painel
│
├── sql/
│   ├── criacao_banco.sql        # DDL — criação do banco narahoteis_db
│   └── consultas.sql            # DQL — consultas com JOIN
│
├── powerbi/
│   └── narahoteis_painel.pbix   # Painel gerencial com comparativos temporais
│
└── README.md
```

---

## 🔄 Etapas do Projeto

### 1️⃣ Pré-processamento em Python
Auditoria completa das 6 bases de dados: identificação e tratamento de inconsistências, padronização de campos, conversão de tipos e exportação das bases limpas.

### 2️⃣ Análise Estatística em Python
Resposta a perguntas de negócio reais da diretoria — distribuição de diárias, detecção de outliers via IQR, cálculo de **RevPAR**, identificação de **overbooking**, correlação de Pearson e regressão linear simples.

### 3️⃣ Painel em Python — Matplotlib
Painel com 4 quadrantes (2×2) com gráficos que respondem perguntas de negócio da rede — livre escolha do time sobre o que visualizar e como justificar.

### 4️⃣ Banco de Dados — MySQL
Criação do banco `narahoteis_db` com 6 tabelas relacionadas via chave estrangeira. Importação das bases tratadas e elaboração de consultas com JOIN.

### 5️⃣ Painel Gerencial — Power BI
Painel conectado aos CSVs tratados com filtro por região, indicadores de performance e comparativos temporais usando `PREVIOUSMONTH` e `SAMEPERIODLASTYEAR`.

---

## 📊 Modelo Relacional

```
reservas ──── unidades ──── funcionarios
   │
   ├──── tipos_quarto
   ├──── clientes
   └──── canais_venda
```

---

## 🏫 Contexto Acadêmico

Projeto desenvolvido como avaliação final da **UC2 — Criar e Manipular Dados Utilizando Matemática Estatística**  
Curso: **Analista de Dados / Big Data Science**  
Instituição: **SENAC RJ**

---

<div align="center">

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Prof.%20Cassio%20Ribeiro-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/profcassio/)
</div>
