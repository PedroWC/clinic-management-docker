-- Dropar o banco de dados se ele já existir
DROP DATABASE IF EXISTS clinic_management;

CREATE DATABASE clinic_management;

USE clinic_management;

CREATE TABLE pacientes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    notas TEXT
);

CREATE TABLE materiais (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE procedimentos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    status VARCHAR(10) NOT NULL
);

CREATE TABLE compras_materiais (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    material_id BIGINT NOT NULL,
    data_compra DATE NOT NULL,
    fornecedor VARCHAR(255),
    valor_total DECIMAL(10, 2) NOT NULL,
    data_validade DATE,
    parcelas INT NOT NULL,
    valor_parcela DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    FOREIGN KEY (material_id) REFERENCES materiais(id)
);

CREATE TABLE consultas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    paciente_id BIGINT NOT NULL,
    procedimento_id BIGINT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    notas TEXT,
    preco_cobrado DECIMAL(10, 2),
    desconto DECIMAL(10, 2),
    status VARCHAR(15) NOT NULL,
    consulta_adiada_id BIGINT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (procedimento_id) REFERENCES procedimentos(id),
    FOREIGN KEY (consulta_adiada_id) REFERENCES consultas(id)
);

CREATE TABLE consulta_material (
    consulta_id BIGINT NOT NULL,
    material_id BIGINT NOT NULL,
    PRIMARY KEY (consulta_id, material_id),
    FOREIGN KEY (consulta_id) REFERENCES consultas(id),
    FOREIGN KEY (material_id) REFERENCES materiais(id)
);

CREATE TABLE historicos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    paciente_id BIGINT NOT NULL,
    procedimento_id BIGINT NOT NULL,
    data_consulta DATE NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2),
    notas TEXT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (procedimento_id) REFERENCES procedimentos(id)
);

CREATE TABLE configuracoes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tempo_lembrete_consulta INT NOT NULL,
    periodo_aviso VARCHAR(10) NOT NULL
);

CREATE TABLE lembretes_retorno (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    consulta_id BIGINT NOT NULL,
    data_retorno TIMESTAMP NOT NULL,
    nota TEXT,
    FOREIGN KEY (consulta_id) REFERENCES consultas(id)
);


-- Inserindo pacientes
INSERT INTO pacientes (nome, data_nascimento, telefone, notas) VALUES
    ('Maria Silva', '1985-04-23', '123456789', 'Paciente regular'),
    ('João Souza', '1990-10-15', '987654321', 'Primeira consulta'),
    ('Ana Lima', '1975-07-30', '456789123', 'Consulta anual'),
    ('Pedro Marques', '1988-02-20', '789123456', 'Retorno mensal'),
    ('Carla Mendes', '1992-11-01', '321654987', 'Precisa de acompanhamento'),
    ('Lucas Oliveira', '1981-08-19', '654321987', 'Consulta trimestral'),
    ('Fernanda Ribeiro', '1979-12-25', '852963741', 'Revisão semestral'),
    ('Ricardo Costa', '1986-03-17', '963852741', 'Acompanhamento de procedimento'),
    ('Juliana Martins', '1993-05-05', '741258963', 'Paciente novo'),
    ('Gustavo Santos', '1984-07-13', '159753486', 'Precisa de retorno');

-- Inserindo materiais
INSERT INTO materiais (nome, descricao, categoria) VALUES
    ('Ácido Hialurônico', 'Usado para preenchimentos faciais', 'ativos'),
    ('Seringa Descartável', 'Seringas para uso único', 'descartáveis'),
    ('Máquina de Laser', 'Equipamento para remoção de pelos', 'investimentos'),
    ('Botox', 'Usado para aplicações estéticas', 'ativos'),
    ('Cânulas', 'Cânulas para uso em procedimentos estéticos', 'descartáveis'),
    ('Gel Condutor', 'Usado para tratamentos com máquinas', 'descartáveis'),
    ('Lentes de Proteção', 'Proteção durante procedimentos a laser', 'investimentos'),
    ('Fios de Sustentação', 'Usados para lifting facial', 'ativos'),
    ('Anestésico Tópico', 'Usado para anestesia local', 'descartáveis'),
    ('Seringa de Insulina', 'Usada para aplicação de Botox', 'descartáveis');

-- Inserindo procedimentos
INSERT INTO procedimentos (descricao, status) VALUES
    ('Preenchimento Facial', 'ativo'),
    ('Remoção de Pelos a Laser', 'ativo'),
    ('Aplicação de Botox', 'ativo'),
    ('Lifting Facial', 'ativo'),
    ('Microagulhamento', 'ativo'),
    ('Peeling Químico', 'ativo'),
    ('Rejuvenescimento Facial', 'ativo'),
    ('Limpeza de Pele', 'ativo'),
    ('Tratamento de Acne', 'ativo'),
    ('Harmonização Facial', 'ativo');

-- Inserindo compras de materiais
INSERT INTO compras_materiais (material_id, data_compra, fornecedor, valor_total, data_validade, parc>    (1, '2023-01-15', 'Fornecedor A', 1500.00, '2024-01-15', 3, 500.00, 'ativos'),
    (2, '2023-03-10', 'Fornecedor B', 300.00, '2023-09-10', 1, 300.00, 'descartáveis'),
    (3, '2023-05-05', 'Fornecedor C', 10000.00, '2028-05-05', 10, 1000.00, 'investimentos'),
    (4, '2023-06-20', 'Fornecedor D', 2000.00, '2024-06-20', 4, 500.00, 'ativos'),
    (5, '2023-04-25', 'Fornecedor E', 500.00, '2023-10-25', 2, 250.00, 'descartáveis'),
    (6, '2023-02-15', 'Fornecedor F', 800.00, '2023-08-15', 1, 800.00, 'descartáveis'),
    (7, '2023-03-30', 'Fornecedor G', 7500.00, '2027-03-30', 5, 1500.00, 'investimentos'),
    (8, '2023-01-10', 'Fornecedor H', 1200.00, '2024-01-10', 3, 400.00, 'ativos'),
    (9, '2023-07-01', 'Fornecedor I', 600.00, '2023-12-31', 1, 600.00, 'descartáveis'),
    (10, '2023-05-15', 'Fornecedor J', 950.00, '2024-05-15', 2, 475.00, 'descartáveis');

-- Inserindo consultas
INSERT INTO consultas (paciente_id, procedimento_id, data_hora, notas, preco_cobrado, desconto, status, consulta_adiada_id) VALUES
    (1, 1, '2024-07-20 10:00:00', 'Primeira consulta de preenchimento', 1200.00, 0.00, 'agendada', NULL),
    (2, 2, '2024-07-22 15:00:00', 'Consulta de remoção de pelos', 500.00, 50.00, 'confirmada', NULL),
    (3, 3, '2024-07-25 09:00:00', 'Aplicação de Botox', 800.00, 80.00, 'cancelada', NULL),
    (4, 4, '2024-07-27 14:00:00', 'Lifting Facial', 3000.00, 300.00, 'realizada', NULL),
    (5, 5, '2024-07-30 11:00:00', 'Microagulhamento', 700.00, 70.00, 'confirmada', NULL),
    (6, 6, '2024-08-02 10:30:00', 'Peeling Químico', 600.00, 60.00, 'agendada', NULL),
    (7, 7, '2024-08-04 13:00:00', 'Rejuvenescimento Facial', 1500.00, 150.00, 'adiada', NULL),
    (8, 7, '2024-08-06 13:00:00', 'Rejuvenescimento Facial (reagendada)', 1500.00, 150.00, 'agendada', NULL),
    (9, 8, '2024-08-08 09:30:00', 'Limpeza de Pele', 300.00, 30.00, 'realizada', NULL),
    (10, 9, '2024-08-10 12:00:00', 'Tratamento de Acne', 1000.00, 100.00, 'confirmada', NULL),
    (1, 1, '2023-07-20 10:00:00', 'Primeira consulta de preenchimento', 1200.00, 0.00, 'realizada', NULL),
    (1, 2, '2023-07-22 15:00:00', 'Consulta de remoção de pelos', 500.00, 50.00, 'realizada', NULL),
    (1, 3, '2023-07-25 09:00:00', 'Aplicação de Botox', 800.00, 80.00, 'realizada', NULL);

-- Inserindo consulta_material
INSERT INTO consulta_material (consulta_id, material_id) VALUES
    (1, 1),
    (2, 2),
    (3, 10),
    (4, 8),
    (5, 5),
    (6, 9),
    (7, 4),
    (8, 4),
    (9, 6),
    (10, 2);

-- Inserindo históricos
INSERT INTO historicos (paciente_id, procedimento_id, data_consulta, descricao, preco, notas) VALUES
    (1, 1, '2023-07-20', 'Preenchimento Facial realizado', 1200.00, 'Consulta sem complicações'),
    (2, 2, '2023-07-22', 'Remoção de pelos realizada', 500.00, 'Desconto de fidelidade aplicado'),
    (3, 3, '2023-07-25', 'Aplicação de Botox realizada', 800.00, 'Cliente retornará em 6 meses'),
    (4, 4, '2023-07-27', 'Lifting Facial realizado', 3000.00, 'Procedimento concluído com sucesso'),
    (5, 5, '2023-07-30', 'Microagulhamento realizado', 700.00, 'Paciente reagendado para acompanhamento'),
    (6, 6, '2023-08-02', 'Peeling Químico realizado', 600.00, 'Cliente satisfeito com o resultado'),
    (7, 7, '2023-08-04', 'Rejuvenescimento Facial realizado', 1500.00, 'Procedimento concluído'),
    (8, 8, '2023-08-08', 'Limpeza de Pele realizada', 300.00, 'Cliente voltará em 3 meses'),
    (9, 9, '2023-08-10', 'Tratamento de Acne realizado', 1000.00, 'Melhora significativa observada'),
    (1, 1, '2023-07-20', 'Preenchimento Facial realizado', 1200.00, 'Consulta sem complicações');

-- Inserindo configurações
INSERT INTO configuracoes (tempo_lembrete_consulta, periodo_aviso) VALUES
    (30, 'semana');
    
-- Inserindo lembretes
INSERT INTO lembretes_retorno (consulta_id, data_retorno, nota) VALUES
    (4, '2024-08-01 10:00:00', 'Oferecer uma nova consulta para acompanhamento pós-lifting facial'),
    (9, '2024-08-15 11:00:00', 'Recomendar nova limpeza de pele após 7 dias'),
    (10, '2024-08-20 09:00:00', 'Avaliar melhora do tratamento de acne e sugerir nova sessão se necessário');
