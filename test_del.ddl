-- 생성자 Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   위치:        2023-08-16 18:32:34 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE sample (
    id      NUMBER(4) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    phone   VARCHAR2(20),
    address VARCHAR2(40) NOT NULL
);

ALTER TABLE sample ADD CONSTRAINT sample_pk PRIMARY KEY ( id );


CREATE TABLE sample_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER (4) NOT NULL
 ,name VARCHAR2 (20) NOT NULL
 ,phone VARCHAR2 (20)
 ,address VARCHAR2 (40) NOT NULL
 );

CREATE OR REPLACE TRIGGER sample_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON sample for each row 
 Declare 
  rec sample_JN%ROWTYPE; 
  blank sample_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.name := :NEW.name; 
      rec.phone := :NEW.phone; 
      rec.address := :NEW.address; 
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
      rec.id := :OLD.id; 
      rec.name := :OLD.name; 
      rec.phone := :OLD.phone; 
      rec.address := :OLD.address; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into sample_JN VALUES rec; 
  END; 
  CREATE TABLE sample2 (
    num       NUMBER(5),
    sale      NUMBER(30),
    point     VARCHAR2(20),
    sample_id NUMBER(4) NOT NULL
);


CREATE TABLE sample2_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,num NUMBER (5)
 ,sale NUMBER (40)
 ,point VARCHAR2 (20)
 ,sample_id NUMBER (4) NOT NULL
 );

CREATE OR REPLACE TRIGGER sample2_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON sample2 for each row 
 Declare 
  rec sample2_JN%ROWTYPE; 
  blank sample2_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.num := :NEW.num; 
      rec.sale := :NEW.sale; 
      rec.point := :NEW.point; 
      rec.sample_id := :NEW.sample_id; 
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
      rec.num := :OLD.num; 
      rec.sale := :OLD.sale; 
      rec.point := :OLD.point; 
      rec.sample_id := :OLD.sample_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into sample2_JN VALUES rec; 
  END; 
  /ALTER TABLE sample2
    ADD CONSTRAINT sample2_sample_fk FOREIGN KEY ( sample_id )
        REFERENCES sample ( id );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             2
-- CREATE INDEX                             0
-- ALTER TABLE                              2
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
