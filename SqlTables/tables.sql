CREATE TABLE usuario (
	id_usuario NUMBER NOT NULL,CREATE
	username VARCHAR2(40) UNIQUE NOT NULL,
	password VARCHAR2(40) NOT NULL,
	nickname VARCHAR2(40) NOT NULL,
	email VARCHAR2(40) UNIQUE NOT NULL,
	constraint USUARIO_PK PRIMARY KEY (id_usuario));

CREATE sequence USUARIO_ID_USUARIO_SEQ;

CREATE trigger BI_USUARIO_ID_USUARIO
  before insert on usuario
  for each row
begin
  select USUARIO_ID_USUARIO_SEQ.nextval into :NEW.id_usuario from dual;
end;

/
CREATE TABLE despesa (
	id_despesa NUMBER NOT NULL,
	nome VARCHAR2(255) NOT NULL,
	valor NUMBER NOT NULL,
	parcelas NUMBER,
	data DATE,
	usuario_id NUMBER NOT NULL,
	tipo_despesa NUMBER,
	constraint DESPESA_PK PRIMARY KEY (id_despesa));

CREATE sequence DESPESA_ID_DESPESA_SEQ;

CREATE trigger BI_DESPESA_ID_DESPESA
  before insert on despesa
  for each row
begin
  select DESPESA_ID_DESPESA_SEQ.nextval into :NEW.id_despesa from dual;
end;

/
CREATE TABLE receita (
	id_receita NUMBER NOT NULL,
	nome VARCHAR2(255) NOT NULL,
	valor NUMBER NOT NULL,
	casionalidade NUMBER,
	data DATE NOT NULL,
	usuario_id NUMBER NOT NULL,
	tipo_receita NUMBER NOT NULL,
	constraint RECEITA_PK PRIMARY KEY (id_receita));

CREATE sequence RECEITA_ID_RECEITA_SEQ;

CREATE trigger BI_RECEITA_ID_RECEITA
  before insert on receita
  for each row
begin
  select RECEITA_ID_RECEITA_SEQ.nextval into :NEW.id_receita from dual;
end;

/
CREATE TABLE recebiveis (
	id_recebivel NUMBER NOT NULL,
	nome_recebivel VARCHAR2(255) NOT NULL,
	valor NUMBER NOT NULL,
	descrição NUMBER NOT NULL,
	usuario_id NUMBER NOT NULL,
	tipo_recebivel NUMBER NOT NULL,
	constraint RECEBIVEIS_PK PRIMARY KEY (id_recebivel));

CREATE sequence RECEBIVEIS_ID_RECEBIVEL_SEQ;

CREATE trigger BI_RECEBIVEIS_ID_RECEBIVEL
  before insert on recebiveis
  for each row
begin
  select RECEBIVEIS_ID_RECEBIVEL_SEQ.nextval into :NEW.id_recebivel from dual;
end;

/
CREATE TABLE tipo_despesa (
	id_tipo_despesa NUMBER NOT NULL,
	tipo_despesa VARCHAR2(255) NOT NULL,
	constraint TIPO_DESPESA_PK PRIMARY KEY (id_tipo_despesa));

CREATE sequence TIPO_DESPESA_ID_TIPO_DESPESA_SEQ;

CREATE trigger BI_TIPO_DESPESA_ID_TIPO_DESPESA
  before insert on tipo_despesa
  for each row
begin
  select TIPO_DESPESA_ID_TIPO_DESPESA_SEQ.nextval into :NEW.id_tipo_despesa from dual;
end;

/
CREATE TABLE tipo_recebivel (
	id_tipo_recebivel NUMBER NOT NULL,
	tipo_recebivel VARCHAR2(255) NOT NULL,
	constraint TIPO_RECEBIVEL_PK PRIMARY KEY (id_tipo_recebivel));

CREATE sequence TIPO_RECEBIVEL_ID_TIPO_RECEBIVEL_SEQ;

CREATE trigger BI_TIPO_RECEBIVEL_ID_TIPO_RECEBIVEL
  before insert on tipo_recebivel
  for each row
begin
  select TIPO_RECEBIVEL_ID_TIPO_RECEBIVEL_SEQ.nextval into :NEW.id_tipo_recebivel from dual;
end;

/
CREATE TABLE tipo_receita (
	id_tipo_receita NUMBER NOT NULL,
	tipo_receita VARCHAR2(255) NOT NULL,
	constraint TIPO_RECEITA_PK PRIMARY KEY (id_tipo_receita));

CREATE sequence TIPO_RECEITA_ID_TIPO_RECEITA_SEQ;

CREATE trigger BI_TIPO_RECEITA_ID_TIPO_RECEITA
  before insert on tipo_receita
  for each row
begin
  select TIPO_RECEITA_ID_TIPO_RECEITA_SEQ.nextval into :NEW.id_tipo_receita from dual;
end;

/

ALTER TABLE despesa ADD CONSTRAINT despesa_fk0 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
ALTER TABLE despesa ADD CONSTRAINT despesa_fk1 FOREIGN KEY (tipo_despesa) REFERENCES tipo_despesa(id_tipo_despesa);

ALTER TABLE receita ADD CONSTRAINT receita_fk0 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
ALTER TABLE receita ADD CONSTRAINT receita_fk1 FOREIGN KEY (tipo_receita) REFERENCES tipo_receita(id_tipo_receita);

ALTER TABLE recebiveis ADD CONSTRAINT recebiveis_fk0 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
ALTER TABLE recebiveis ADD CONSTRAINT recebiveis_fk1 FOREIGN KEY (tipo_recebivel) REFERENCES tipo_recebivel(id_tipo_recebivel);




