/* prototipo_tcc */
DROP TABLE IF EXISTS Empresa;
CREATE OF NOT EXISTS TABLE Empresa (
    id INT PRIMARY KEY,
    cnpj INT,
    nome VARCHAR (100),
    email VARCHAR (100),
    telefone INT,
    endereco VARCHAR (100)
)engine=InnoDb;

DROP TABLE IF EXISTS Aluno;
CREATE IF NOT EXISTS TABLE Aluno (
    email VARCHAR (100) PRIMARY KEY,
    nome VARCHAR (100),
    telefone INT,
    endereco VARCHAR (100),
    dataNasc DATE,
    cidade VARCHAR (50)
)engine=InnoDb;

DROP TABLE IF EXISTS Vagas;
CREATE IF NOT EXISTSTABLE Vagas (
    id INT PRIMARY KEY,
    fk_Empresa_id INT,
    vagaTitulo VARCHAR (50),
    descricao VARCHAR (300),
    dataAnuncio DATE,
    vagasNum INT
)engine=InnoDb;

DROP TABLE IF EXISTS Candidata;
CREATE IF NOT EXISTS TABLE Candidata (
    fk_Aluno_email VARCHAR (100),
    fk_Vagas_id INT,
    status TEXT
)engine=InnoDb;

DROP TABLE IF EXISTS Curriculo;
CREATE IF NOT EXISTS TABLE Curriculo (
    id INT PRIMARY KEY,
    fk_Aluno_email VARCHAR (100),
    nome VARCHAR (100),
    endereco VARCHAR (100),
    telefone INT,
    email VARCHAR (100),
    escolaridade VARCHAR (100),
    cursos VARCHAR (100),
    experienciaProfissional VARCHAR (200),
    infoAdicionais VARCHAR (200)
)engine=InnoDb;

DROP TABLE IF EXISTS Formacao;
CREATE IF NOT EXISTS TABLE Formacao (
    id INT PRIMARY KEY,
    fk_Curriculo_id INT,
    tipo VARCHAR (100),
    formAno VARCHAR (100)
)engine=InnoDb;

DROP TABLE IF EXISTS Chat;
CREATE IF NOT EXISTS TABLE Chat (
    id INT PRIMARY KEY,
    fk_Aluno_email VARCHAR (100),
    fk_Vagas_id INT
)engine=InnoDb;

DROP TABLE IF EXISTS Mensagem;
CREATE IF NOT EXISTS TABLE Mensagem (
    fk_Chat_id INT,
    data DATE,
    texto VARCHAR (300),
	remetente VARCHAR (50)
)engine=InnoDb;
 
ALTER TABLE Vagas ADD CONSTRAINT FK_Vagas_2
    FOREIGN KEY (fk_Empresa_id)
    REFERENCES Empresa (id);
 
ALTER TABLE Candidata ADD CONSTRAINT FK_Candidata_1
    FOREIGN KEY (fk_Aluno_email)
    REFERENCES Aluno (email);
 
ALTER TABLE Candidata ADD CONSTRAINT FK_Candidata_2
    FOREIGN KEY (fk_Vagas_id)
    REFERENCES Vagas (id);
 
ALTER TABLE Curriculo ADD CONSTRAINT FK_Curriculo_2
    FOREIGN KEY (fk_Aluno_email)
    REFERENCES Aluno (email);
 
ALTER TABLE Formacao ADD CONSTRAINT FK_Formacao_1
    FOREIGN KEY (fk_Curriculo_id)
    REFERENCES Curriculo (id);
 
ALTER TABLE Chat ADD CONSTRAINT FK_Chat_1
    FOREIGN KEY (fk_Aluno_email)
    REFERENCES Aluno (email);
 
ALTER TABLE Chat ADD CONSTRAINT FK_Chat_2
    FOREIGN KEY (fk_Vagas_id)
    REFERENCES Vagas (id);
 
ALTER TABLE Mensagem ADD CONSTRAINT FK_Mensagem_1
    FOREIGN KEY (fk_Chat_id)
    REFERENCES Chat (id);
	
	