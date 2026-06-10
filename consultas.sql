-- ============================================================
-- NaraHoteis — Consultas de Referência
-- Arquivo: consultas.sql
-- Todas as consultas utilizam JOIN entre as tabelas do banco
-- ============================================================

USE narahoteis_db;

-- ============================================================
-- EXEMPLO 1
-- Total de reservas por unidade e região
-- ============================================================
SELECT
    u.regiao,
    u.nome_unidade,
    COUNT(r.id_reserva) AS total_reservas
FROM reservas r
JOIN unidades u ON r.id_unidade = u.id_unidade
GROUP BY u.regiao, u.nome_unidade
ORDER BY u.regiao, total_reservas DESC;


-- ============================================================
-- EXEMPLO 2
-- Receita total por unidade
-- (qtd_diarias × valor_diaria_base)
-- ============================================================
SELECT
    u.nome_unidade,
    u.regiao,
    SUM(r.qtd_diarias * tq.valor_diaria_base) AS receita_total
FROM reservas r
JOIN unidades    u  ON r.id_unidade     = u.id_unidade
JOIN tipos_quarto tq ON r.id_tipo_quarto = tq.id_tipo_quarto
WHERE r.status_reserva IN ('Confirmada', 'Concluída')
GROUP BY u.nome_unidade, u.regiao
ORDER BY receita_total DESC;


-- ============================================================
-- EXEMPLO 3
-- Avaliação média dos hóspedes por unidade
-- ============================================================
SELECT
    u.nome_unidade,
    u.regiao,
    ROUND(AVG(r.avaliacao_hospede), 2) AS avaliacao_media,
    COUNT(r.avaliacao_hospede)         AS total_avaliacoes
FROM reservas r
JOIN unidades u ON r.id_unidade = u.id_unidade
WHERE r.avaliacao_hospede IS NOT NULL
GROUP BY u.nome_unidade, u.regiao
ORDER BY avaliacao_media DESC;


-- ============================================================
-- EXEMPLO 4
-- Distribuição de reservas por canal de venda
-- ============================================================
SELECT
    cv.nome_canal,
    COUNT(r.id_reserva)                AS total_reservas,
    ROUND(AVG(r.avaliacao_hospede), 2) AS avaliacao_media
FROM reservas r
JOIN canais_venda cv ON r.id_canal = cv.id_canal
GROUP BY cv.nome_canal
ORDER BY total_reservas DESC;


-- ============================================================
-- EXEMPLO 5
-- Funcionários por unidade com salário acima da média geral
-- ============================================================
SELECT
    u.nome_unidade,
    f.nome,
    f.cargo,
    f.salario
FROM funcionarios f
JOIN unidades u ON f.id_unidade = u.id_unidade
WHERE f.salario > (
    SELECT AVG(salario)
    FROM funcionarios
    WHERE salario IS NOT NULL
)
ORDER BY u.nome_unidade, f.salario DESC;


-- ============================================================
-- EXEMPLO 6
-- Tipo de quarto mais reservado por região
-- ============================================================
SELECT
    u.regiao,
    tq.descricao              AS tipo_quarto,
    COUNT(r.id_reserva)       AS total_reservas
FROM reservas r
JOIN unidades     u  ON r.id_unidade     = u.id_unidade
JOIN tipos_quarto tq ON r.id_tipo_quarto = tq.id_tipo_quarto
GROUP BY u.regiao, tq.descricao
ORDER BY u.regiao, total_reservas DESC;


-- ============================================================
-- EXEMPLO 7
-- Clientes com mais reservas e sua avaliação média
-- ============================================================
SELECT
    c.nome,
    c.tipo_cliente,
    c.estado_origem,
    COUNT(r.id_reserva)                AS total_reservas,
    ROUND(AVG(r.avaliacao_hospede), 2) AS avaliacao_media
FROM reservas r
JOIN clientes c ON r.id_cliente = c.id_cliente
GROUP BY c.nome, c.tipo_cliente, c.estado_origem
ORDER BY total_reservas DESC
LIMIT 10;
