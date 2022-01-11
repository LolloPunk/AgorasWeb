CREATE TABLE TEMA (
    id_tema Integer PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    descricao VARCHAR(200),
    FK_USUARIOS_id_usuario Integer
);

CREATE TABLE USUARIOS (
    id_usuario Integer PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    nome_de_usuario VARCHAR(50),
    senha VARCHAR(130),
    email VARCHAR(50)
);

CREATE TABLE CURTIDA (
    id_curtida Integer PRIMARY KEY AUTO_INCREMENT,
    FK_USUARIOS_id_usuario Integer,
    FK_TEMA_id_tema Integer
);

/* 
// TODO Lorena
alterar tabela debate, pq temos dois id_tema
tem que tirar o id_tema e deixar o fk_tema_id_tema
*/

CREATE TABLE DEBATE (
    id_debate Integer PRIMARY KEY AUTO_INCREMENT,
    id_tema Integer,
    dt_inicio DATE,
    dt_final DATE,
    FK_TEMA_id_tema Integer
);

CREATE TABLE COMENTARIO (
    id_comentario Integer PRIMARY KEY AUTO_INCREMENT,
    data_envio DATE,
    comentario VARCHAR(500),
    FK_DEBATE_id_debate Integer,
    FK_USUARIOS_id_usuario Integer
);

CREATE TABLE RESPOSTA (
    id_resposta Integer PRIMARY KEY AUTO_INCREMENT,
    resposta VARCHAR(500),
    data_envio DATE,
    FK_COMENTARIO_id_comentario Integer,
    FK_USUARIOS_id_usuario Integer
);
 
ALTER TABLE TEMA ADD CONSTRAINT FK_TEMA_2
    FOREIGN KEY (FK_USUARIOS_id_usuario)
    REFERENCES USUARIOS (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE CURTIDA ADD CONSTRAINT FK_CURTIDA_2
    FOREIGN KEY (FK_USUARIOS_id_usuario)
    REFERENCES USUARIOS (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE CURTIDA ADD CONSTRAINT FK_CURTIDA_3
    FOREIGN KEY (FK_TEMA_id_tema)
    REFERENCES TEMA (id_tema)
    ON DELETE CASCADE;
 
ALTER TABLE DEBATE ADD CONSTRAINT FK_DEBATE_2
    FOREIGN KEY (FK_TEMA_id_tema)
    REFERENCES TEMA (id_tema)
    ON DELETE CASCADE;
 
ALTER TABLE COMENTARIO ADD CONSTRAINT FK_COMENTARIO_2
    FOREIGN KEY (FK_DEBATE_id_debate)
    REFERENCES DEBATE (id_debate)
    ON DELETE CASCADE;
 
ALTER TABLE COMENTARIO ADD CONSTRAINT FK_COMENTARIO_3
    FOREIGN KEY (FK_USUARIOS_id_usuario)
    REFERENCES USUARIOS (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE RESPOSTA ADD CONSTRAINT FK_RESPOSTA_2
    FOREIGN KEY (FK_COMENTARIO_id_comentario)
    REFERENCES COMENTARIO (id_comentario)
    ON DELETE CASCADE;
 
ALTER TABLE RESPOSTA ADD CONSTRAINT FK_RESPOSTA_3
    FOREIGN KEY (FK_USUARIOS_id_usuario)
    REFERENCES USUARIOS (id_usuario)
    ON DELETE CASCADE;