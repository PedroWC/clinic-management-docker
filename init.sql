-- Dropar o banco de dados se ele já existir
DROP DATABASE IF EXISTS clinic_management;

USE clinic_management;

CREATE TABLE procedimentos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE pacientes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    notas TEXT
);

CREATE TABLE consultas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    paciente_id BIGINT NOT NULL,
    procedimento_id BIGINT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    notas TEXT,
    preco_cobrado DECIMAL(10, 2),
    desconto DECIMAL(10, 2),
    valor_gasto_descartaveis DECIMAL(10, 2),
    valor_gasto_insumos DECIMAL(10, 2),
    status VARCHAR(50),
    consulta_adiada_id BIGINT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (procedimento_id) REFERENCES procedimentos(id)
);

CREATE TABLE lembretes_retorno (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    consulta_id BIGINT NOT NULL,
    data_retorno DATE NOT NULL,
    nota TEXT,
    FOREIGN KEY (consulta_id) REFERENCES consultas(id)
);

CREATE TABLE configuracoes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    chave VARCHAR(255) NOT NULL,
    valor VARCHAR(255) NOT NULL
);

INSERT INTO configuracoes ('chave', 'valor') VALUES
    ('periodoAviso', 'diario'),
    ('mensagemAniversario', 'Feliz Aniversário! Que seu dia seja repleto de alegria e realizações.'),
    ('mensagemConfirmacao', 'Estou entrando em contato para confirmar sua próxima consulta. Caso precise reagendar, entre em contato conosco.'),
    ('tempoLembreteConsulta', '7'),
    ('mensagemNovaConsulta', 'Estamos entrando em contato para oferecer uma nova consulta. Por favor, entre em contato conosco para agendar sua próxima visita.');
