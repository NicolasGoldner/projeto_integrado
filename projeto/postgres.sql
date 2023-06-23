
CREATE TABLE talento (
                talento_id VARCHAR NOT NULL,
                talento VARCHAR,
                CONSTRAINT talento_id PRIMARY KEY (talento_id)
);
COMMENT ON TABLE talento IS 'Tabela que guarda os talentos';
COMMENT ON COLUMN talento.talento_id IS 'PK tabela talento';
COMMENT ON COLUMN talento.talento IS 'Guarda o tipo de talento';


CREATE TABLE grupo (
                grupo_id VARCHAR NOT NULL UNIQUE, 
                talento_id VARCHAR NOT NULL,
                grupo_nome VARCHAR ,
                CONSTRAINT grupo_id PRIMARY KEY (grupo_id, talento_id)
);
COMMENT ON TABLE grupo IS 'Tabela que guarda os grupos';
COMMENT ON COLUMN grupo.grupo_id IS 'PK da tabela grupo';
COMMENT ON COLUMN grupo.talento_id IS 'PK tabela talento';
COMMENT ON COLUMN grupo.grupo_nome IS 'Guarda o nome do grupo';


CREATE TABLE evento (
                evento_id VARCHAR NOT NULL,
                grupo_id VARCHAR NOT NULL,
                evento_foto BYTEA,
                data DATE,
                evento_nome VARCHAR,
                localizacao VARCHAR,
                CONSTRAINT evento_id PRIMARY KEY (evento_id, grupo_id)
);
COMMENT ON TABLE evento IS 'Tabela que guarda os eventos';
COMMENT ON COLUMN evento.evento_id IS 'PK do evento';
COMMENT ON COLUMN evento.grupo_id IS 'PK da tabela grupo';
COMMENT ON COLUMN evento.evento_foto IS 'guarda as fotos dos eventos';
COMMENT ON COLUMN evento.data IS 'Guarda a data do evento';
COMMENT ON COLUMN evento.evento_nome IS 'Guarda o nome do evento';
COMMENT ON COLUMN evento.localizacao IS 'Guarda a localização do evento';


CREATE TABLE usuario (
                email VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                telefone NUMERIC NOT NULL,
                foto BYTEA NOT NULL,
                setor VARCHAR NOT NULL,
                CONSTRAINT usuario_id PRIMARY KEY (email)
);
COMMENT ON TABLE usuario IS 'Tabela onde se guarda as informações dos usuários';
COMMENT ON COLUMN usuario.email IS 'guarda o emails do usuário';
COMMENT ON COLUMN usuario.nome IS 'Essa tabela guarda nome dos usuários';
COMMENT ON COLUMN usuario.telefone IS 'Guarda o número do usuário';
COMMENT ON COLUMN usuario.foto IS 'guarda a foto do usuário';
COMMENT ON COLUMN usuario.setor IS 'Guarda os setores de cada usuario';


CREATE TABLE participantes (
                email VARCHAR NOT NULL,
                grupo_id VARCHAR NOT NULL,
                talento_id VARCHAR NOT NULL,
                Participantes VARCHAR,
                CONSTRAINT participantes_id PRIMARY KEY (email, grupo_id, talento_id)
);
COMMENT ON TABLE participantes IS 'Tabela aonde se guarda os participantes';
COMMENT ON COLUMN participantes.email IS 'guarda o emails do usuário';
COMMENT ON COLUMN participantes.grupo_id IS 'PK da tabela grupo';
COMMENT ON COLUMN participantes.talento_id IS 'PK tabela talento';
COMMENT ON COLUMN participantes.Participantes IS 'Guardas os participantes de cada grupo';


CREATE TABLE descricao_talento (
                talento_id VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                descricao_talento VARCHAR,
                CONSTRAINT descricao_talento_id PRIMARY KEY (talento_id, email)
);
COMMENT ON TABLE descricao_talento IS 'Tabela que guarda as descrições dos talentos';
COMMENT ON COLUMN descricao_talento.talento_id IS 'PK tabela talento';
COMMENT ON COLUMN descricao_talento.email IS 'guarda o emails do usuário';
COMMENT ON COLUMN descricao_talento.descricao_talento IS 'Guarda a descrição de um talento de um usuário';


ALTER TABLE descricao_talento ADD CONSTRAINT talento_descricao_talento_fk
FOREIGN KEY (talento_id)
REFERENCES talento (talento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE grupo ADD CONSTRAINT talento_grupo_fk
FOREIGN KEY (talento_id)
REFERENCES talento (talento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE evento ADD CONSTRAINT grupo_evento_fk
FOREIGN KEY (grupo_id)
REFERENCES grupo (grupo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE participantes ADD CONSTRAINT grupo_participantes_fk
FOREIGN KEY (talento_id, grupo_id)
REFERENCES grupo (talento_id, grupo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE descricao_talento ADD CONSTRAINT usuario_descricao_talento_fk
FOREIGN KEY (email)
REFERENCES usuario (email)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE participantes ADD CONSTRAINT usuario_participantes_fk
FOREIGN KEY (email)
REFERENCES usuario (email)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;