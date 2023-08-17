-- ������ Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   ��ġ:        2023-08-17 15:56:09 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ���� (
    ���¹�ȣ NUMBER NOT NULL
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ���¹�ȣ );


CREATE TABLE ����_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,���¹�ȣ NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER ����_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ���� for each row 
 Declare 
  rec ����_JN%ROWTYPE; 
  blank ����_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.���¹�ȣ := :NEW.���¹�ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.���¹�ȣ := :OLD.���¹�ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ����_JN VALUES rec; 
  END; 
  /CREATE TABLE ���� (
    ������ȣ    NUMBER NOT NULL,
    �а���ȣ    NUMBER,
    �а�_�а���ȣ NUMBER NOT NULL,
    ���¹�ȣ    NUMBER,
    ����_���¹�ȣ NUMBER NOT NULL
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ������ȣ );


CREATE TABLE ����_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,������ȣ NUMBER NOT NULL
 ,�а���ȣ NUMBER
 ,�а�_�а���ȣ NUMBER NOT NULL
 ,���¹�ȣ NUMBER
 ,����_���¹�ȣ NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER ����_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ���� for each row 
 Declare 
  rec ����_JN%ROWTYPE; 
  blank ����_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.������ȣ := :NEW.������ȣ; 
      rec.�а���ȣ := :NEW.�а���ȣ; 
      rec.�а�_�а���ȣ := :NEW.�а�_�а���ȣ; 
      rec.���¹�ȣ := :NEW.���¹�ȣ; 
      rec.����_���¹�ȣ := :NEW.����_���¹�ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.������ȣ := :OLD.������ȣ; 
      rec.�а���ȣ := :OLD.�а���ȣ; 
      rec.�а�_�а���ȣ := :OLD.�а�_�а���ȣ; 
      rec.���¹�ȣ := :OLD.���¹�ȣ; 
      rec.����_���¹�ȣ := :OLD.����_���¹�ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ����_JN VALUES rec; 
  END; 
  /CREATE TABLE �������� (
    �л���ȣ    NUMBER NOT NULL,
    ���¹�ȣ    NUMBER,
    �����ڵ�    NVARCHAR2(20) NOT NULL,
    ����_���¹�ȣ NUMBER NOT NULL,
    �л�_�л���ȣ NUMBER NOT NULL
);

ALTER TABLE �������� ADD CONSTRAINT ��������_pk PRIMARY KEY ( �����ڵ� );


CREATE TABLE ��������_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,�л���ȣ NUMBER NOT NULL
 ,���¹�ȣ NUMBER
 ,�����ڵ� NVARCHAR2 (20) NOT NULL
 ,����_���¹�ȣ NUMBER NOT NULL
 ,�л�_�л���ȣ NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER ��������_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON �������� for each row 
 Declare 
  rec ��������_JN%ROWTYPE; 
  blank ��������_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.�л���ȣ := :NEW.�л���ȣ; 
      rec.���¹�ȣ := :NEW.���¹�ȣ; 
      rec.�����ڵ� := :NEW.�����ڵ�; 
      rec.����_���¹�ȣ := :NEW.����_���¹�ȣ; 
      rec.�л�_�л���ȣ := :NEW.�л�_�л���ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.�л���ȣ := :OLD.�л���ȣ; 
      rec.���¹�ȣ := :OLD.���¹�ȣ; 
      rec.�����ڵ� := :OLD.�����ڵ�; 
      rec.����_���¹�ȣ := :OLD.����_���¹�ȣ; 
      rec.�л�_�л���ȣ := :OLD.�л�_�л���ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ��������_JN VALUES rec; 
  END; 
  /CREATE TABLE �а� (
    �а���ȣ NUMBER NOT NULL
);

ALTER TABLE �а� ADD CONSTRAINT �а�_pk PRIMARY KEY ( �а���ȣ );


CREATE TABLE �а�_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,�а���ȣ NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER �а�_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON �а� for each row 
 Declare 
  rec �а�_JN%ROWTYPE; 
  blank �а�_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.�а���ȣ := :NEW.�а���ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.�а���ȣ := :OLD.�а���ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into �а�_JN VALUES rec; 
  END; 
  /CREATE TABLE �л� (
    �л���ȣ    NUMBER NOT NULL,
    ������ȣ    NUMBER,
    �а���ȣ    NUMBER,
    �а�_�а���ȣ NUMBER NOT NULL,
    ����_������ȣ NUMBER NOT NULL
);

ALTER TABLE �л� ADD CONSTRAINT �л�_pk PRIMARY KEY ( �л���ȣ );


CREATE TABLE �л�_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,�л���ȣ NUMBER NOT NULL
 ,������ȣ NUMBER
 ,�а���ȣ NUMBER
 ,�а�_�а���ȣ NUMBER NOT NULL
 ,����_������ȣ NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER �л�_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON �л� for each row 
 Declare 
  rec �л�_JN%ROWTYPE; 
  blank �л�_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.�л���ȣ := :NEW.�л���ȣ; 
      rec.������ȣ := :NEW.������ȣ; 
      rec.�а���ȣ := :NEW.�а���ȣ; 
      rec.�а�_�а���ȣ := :NEW.�а�_�а���ȣ; 
      rec.����_������ȣ := :NEW.����_������ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.�л���ȣ := :OLD.�л���ȣ; 
      rec.������ȣ := :OLD.������ȣ; 
      rec.�а���ȣ := :OLD.�а���ȣ; 
      rec.�а�_�а���ȣ := :OLD.�а�_�а���ȣ; 
      rec.����_������ȣ := :OLD.����_������ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into �л�_JN VALUES rec; 
  END; 
  /ALTER TABLE ����
    ADD CONSTRAINT ����_����_fk FOREIGN KEY ( ����_���¹�ȣ )
        REFERENCES ���� ( ���¹�ȣ );

ALTER TABLE ����
    ADD CONSTRAINT ����_�а�_fk FOREIGN KEY ( �а�_�а���ȣ )
        REFERENCES �а� ( �а���ȣ );

ALTER TABLE ��������
    ADD CONSTRAINT ��������_����_fk FOREIGN KEY ( ����_���¹�ȣ )
        REFERENCES ���� ( ���¹�ȣ );

ALTER TABLE ��������
    ADD CONSTRAINT ��������_�л�_fk FOREIGN KEY ( �л�_�л���ȣ )
        REFERENCES �л� ( �л���ȣ );

ALTER TABLE �л�
    ADD CONSTRAINT �л�_����_fk FOREIGN KEY ( ����_������ȣ )
        REFERENCES ���� ( ������ȣ );

ALTER TABLE �л�
    ADD CONSTRAINT �л�_�а�_fk FOREIGN KEY ( �а�_�а���ȣ )
        REFERENCES �а� ( �а���ȣ );



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
