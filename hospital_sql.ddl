-- ������ Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   ��ġ:        2023-08-17 16:28:59 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ��ȣ�� (
    ��ȣ��id   NUMBER(10) NOT NULL,
    ��Ʈ_��Ʈ��ȣ NUMBER(10) NOT NULL
);

ALTER TABLE ��ȣ�� ADD CONSTRAINT ��ȣ��_pk PRIMARY KEY ( ��ȣ��id );


CREATE TABLE ��ȣ��_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,��ȣ��ID NUMBER (10) NOT NULL
 ,��Ʈ_��Ʈ��ȣ NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER ��ȣ��_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ��ȣ�� for each row 
 Declare 
  rec ��ȣ��_JN%ROWTYPE; 
  blank ��ȣ��_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.��ȣ��ID := :NEW.��ȣ��ID; 
      rec.��Ʈ_��Ʈ��ȣ := :NEW.��Ʈ_��Ʈ��ȣ; 
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
      rec.��ȣ��ID := :OLD.��ȣ��ID; 
      rec.��Ʈ_��Ʈ��ȣ := :OLD.��Ʈ_��Ʈ��ȣ; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ��ȣ��_JN VALUES rec; 
  END; 
  /CREATE TABLE �ǻ� (
    �ǻ�id NUMBER(10) NOT NULL
);

ALTER TABLE �ǻ� ADD CONSTRAINT �ǻ�_pk PRIMARY KEY ( �ǻ�id );


CREATE TABLE �ǻ�_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,�ǻ�ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER �ǻ�_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON �ǻ� for each row 
 Declare 
  rec �ǻ�_JN%ROWTYPE; 
  blank �ǻ�_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.�ǻ�ID := :NEW.�ǻ�ID; 
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
      rec.�ǻ�ID := :OLD.�ǻ�ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into �ǻ�_JN VALUES rec; 
  END; 
  /CREATE TABLE ���� (
    ����id    NUMBER(10) NOT NULL,
    �ǻ�id    NUMBER(10),
    ȯ��id    NUMBER(10),
    �ǻ�_�ǻ�id NUMBER(10) NOT NULL
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ����id );


CREATE TABLE ����_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,����ID NUMBER (10) NOT NULL
 ,�ǻ�ID NUMBER (10)
 ,ȯ��ID NUMBER (10)
 ,�ǻ�_�ǻ�ID NUMBER (10) NOT NULL
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
      rec.����ID := :NEW.����ID; 
      rec.�ǻ�ID := :NEW.�ǻ�ID; 
      rec.ȯ��ID := :NEW.ȯ��ID; 
      rec.�ǻ�_�ǻ�ID := :NEW.�ǻ�_�ǻ�ID; 
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
      rec.����ID := :OLD.����ID; 
      rec.�ǻ�ID := :OLD.�ǻ�ID; 
      rec.ȯ��ID := :OLD.ȯ��ID; 
      rec.�ǻ�_�ǻ�ID := :OLD.�ǻ�_�ǻ�ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ����_JN VALUES rec; 
  END; 
  /CREATE TABLE ��Ʈ (
    ��Ʈ��ȣ    NUMBER(10) NOT NULL,
    ����id    NUMBER(10),
    ��ȣ��id   NUMBER(10),
    ����_����id NUMBER(10) NOT NULL
);

ALTER TABLE ��Ʈ ADD CONSTRAINT ġ��_pk PRIMARY KEY ( ��Ʈ��ȣ );


CREATE TABLE ��Ʈ_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,��Ʈ��ȣ NUMBER (10) NOT NULL
 ,����ID NUMBER (10)
 ,��ȣ��ID NUMBER (10)
 ,����_����ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER ��Ʈ_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ��Ʈ for each row 
 Declare 
  rec ��Ʈ_JN%ROWTYPE; 
  blank ��Ʈ_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.��Ʈ��ȣ := :NEW.��Ʈ��ȣ; 
      rec.����ID := :NEW.����ID; 
      rec.��ȣ��ID := :NEW.��ȣ��ID; 
      rec.����_����ID := :NEW.����_����ID; 
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
      rec.��Ʈ��ȣ := :OLD.��Ʈ��ȣ; 
      rec.����ID := :OLD.����ID; 
      rec.��ȣ��ID := :OLD.��ȣ��ID; 
      rec.����_����ID := :OLD.����_����ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ��Ʈ_JN VALUES rec; 
  END; 
  /CREATE TABLE ȯ�� (
    ȯ��id      NUMBER(10) NOT NULL,
    ��ȣ��id     NUMBER(10),
    �ǻ�id      NUMBER(10),
    �ǻ�_�ǻ�id   NUMBER(10) NOT NULL,
    ��ȣ��_��ȣ��id NUMBER(10) NOT NULL
);

ALTER TABLE ȯ�� ADD CONSTRAINT ȯ��_pk PRIMARY KEY ( ȯ��id );


CREATE TABLE ȯ��_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ȯ��ID NUMBER (10) NOT NULL
 ,��ȣ��ID NUMBER (10)
 ,�ǻ�ID NUMBER (10)
 ,�ǻ�_�ǻ�ID NUMBER (10) NOT NULL
 ,��ȣ��_��ȣ��ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER ȯ��_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ȯ�� for each row 
 Declare 
  rec ȯ��_JN%ROWTYPE; 
  blank ȯ��_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ȯ��ID := :NEW.ȯ��ID; 
      rec.��ȣ��ID := :NEW.��ȣ��ID; 
      rec.�ǻ�ID := :NEW.�ǻ�ID; 
      rec.�ǻ�_�ǻ�ID := :NEW.�ǻ�_�ǻ�ID; 
      rec.��ȣ��_��ȣ��ID := :NEW.��ȣ��_��ȣ��ID; 
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
      rec.ȯ��ID := :OLD.ȯ��ID; 
      rec.��ȣ��ID := :OLD.��ȣ��ID; 
      rec.�ǻ�ID := :OLD.�ǻ�ID; 
      rec.�ǻ�_�ǻ�ID := :OLD.�ǻ�_�ǻ�ID; 
      rec.��ȣ��_��ȣ��ID := :OLD.��ȣ��_��ȣ��ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ȯ��_JN VALUES rec; 
  END; 
  /ALTER TABLE ��ȣ��
    ADD CONSTRAINT ��ȣ��_��Ʈ_fk FOREIGN KEY ( ��Ʈ_��Ʈ��ȣ )
        REFERENCES ��Ʈ ( ��Ʈ��ȣ );

ALTER TABLE ����
    ADD CONSTRAINT ����_�ǻ�_fk FOREIGN KEY ( �ǻ�_�ǻ�id )
        REFERENCES �ǻ� ( �ǻ�id );

ALTER TABLE ��Ʈ
    ADD CONSTRAINT ��Ʈ_����_fk FOREIGN KEY ( ����_����id )
        REFERENCES ���� ( ����id );

ALTER TABLE ȯ��
    ADD CONSTRAINT ȯ��_��ȣ��_fk FOREIGN KEY ( ��ȣ��_��ȣ��id )
        REFERENCES ��ȣ�� ( ��ȣ��id );

ALTER TABLE ȯ��
    ADD CONSTRAINT ȯ��_�ǻ�_fk FOREIGN KEY ( �ǻ�_�ǻ�id )
        REFERENCES �ǻ� ( �ǻ�id );



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
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
