-- 생성자 Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   위치:        2023-08-17 16:28:59 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE 간호사 (
    간호사id   NUMBER(10) NOT NULL,
    차트_차트번호 NUMBER(10) NOT NULL
);

ALTER TABLE 간호사 ADD CONSTRAINT 간호사_pk PRIMARY KEY ( 간호사id );


CREATE TABLE 간호사_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,간호사ID NUMBER (10) NOT NULL
 ,차트_차트번호 NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER 간호사_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 간호사 for each row 
 Declare 
  rec 간호사_JN%ROWTYPE; 
  blank 간호사_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.간호사ID := :NEW.간호사ID; 
      rec.차트_차트번호 := :NEW.차트_차트번호; 
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
      rec.간호사ID := :OLD.간호사ID; 
      rec.차트_차트번호 := :OLD.차트_차트번호; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 간호사_JN VALUES rec; 
  END; 
  /CREATE TABLE 의사 (
    의사id NUMBER(10) NOT NULL
);

ALTER TABLE 의사 ADD CONSTRAINT 의사_pk PRIMARY KEY ( 의사id );


CREATE TABLE 의사_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,의사ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER 의사_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 의사 for each row 
 Declare 
  rec 의사_JN%ROWTYPE; 
  blank 의사_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.의사ID := :NEW.의사ID; 
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
      rec.의사ID := :OLD.의사ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 의사_JN VALUES rec; 
  END; 
  /CREATE TABLE 진료 (
    진료id    NUMBER(10) NOT NULL,
    의사id    NUMBER(10),
    환자id    NUMBER(10),
    의사_의사id NUMBER(10) NOT NULL
);

ALTER TABLE 진료 ADD CONSTRAINT 진료_pk PRIMARY KEY ( 진료id );


CREATE TABLE 진료_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,진료ID NUMBER (10) NOT NULL
 ,의사ID NUMBER (10)
 ,환자ID NUMBER (10)
 ,의사_의사ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER 진료_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 진료 for each row 
 Declare 
  rec 진료_JN%ROWTYPE; 
  blank 진료_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.진료ID := :NEW.진료ID; 
      rec.의사ID := :NEW.의사ID; 
      rec.환자ID := :NEW.환자ID; 
      rec.의사_의사ID := :NEW.의사_의사ID; 
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
      rec.진료ID := :OLD.진료ID; 
      rec.의사ID := :OLD.의사ID; 
      rec.환자ID := :OLD.환자ID; 
      rec.의사_의사ID := :OLD.의사_의사ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 진료_JN VALUES rec; 
  END; 
  /CREATE TABLE 차트 (
    차트번호    NUMBER(10) NOT NULL,
    진료id    NUMBER(10),
    간호사id   NUMBER(10),
    진료_진료id NUMBER(10) NOT NULL
);

ALTER TABLE 차트 ADD CONSTRAINT 치료_pk PRIMARY KEY ( 차트번호 );


CREATE TABLE 차트_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,차트번호 NUMBER (10) NOT NULL
 ,진료ID NUMBER (10)
 ,간호사ID NUMBER (10)
 ,진료_진료ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER 차트_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 차트 for each row 
 Declare 
  rec 차트_JN%ROWTYPE; 
  blank 차트_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.차트번호 := :NEW.차트번호; 
      rec.진료ID := :NEW.진료ID; 
      rec.간호사ID := :NEW.간호사ID; 
      rec.진료_진료ID := :NEW.진료_진료ID; 
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
      rec.차트번호 := :OLD.차트번호; 
      rec.진료ID := :OLD.진료ID; 
      rec.간호사ID := :OLD.간호사ID; 
      rec.진료_진료ID := :OLD.진료_진료ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 차트_JN VALUES rec; 
  END; 
  /CREATE TABLE 환자 (
    환자id      NUMBER(10) NOT NULL,
    간호사id     NUMBER(10),
    의사id      NUMBER(10),
    의사_의사id   NUMBER(10) NOT NULL,
    간호사_간호사id NUMBER(10) NOT NULL
);

ALTER TABLE 환자 ADD CONSTRAINT 환자_pk PRIMARY KEY ( 환자id );


CREATE TABLE 환자_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,환자ID NUMBER (10) NOT NULL
 ,간호사ID NUMBER (10)
 ,의사ID NUMBER (10)
 ,의사_의사ID NUMBER (10) NOT NULL
 ,간호사_간호사ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER 환자_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 환자 for each row 
 Declare 
  rec 환자_JN%ROWTYPE; 
  blank 환자_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.환자ID := :NEW.환자ID; 
      rec.간호사ID := :NEW.간호사ID; 
      rec.의사ID := :NEW.의사ID; 
      rec.의사_의사ID := :NEW.의사_의사ID; 
      rec.간호사_간호사ID := :NEW.간호사_간호사ID; 
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
      rec.환자ID := :OLD.환자ID; 
      rec.간호사ID := :OLD.간호사ID; 
      rec.의사ID := :OLD.의사ID; 
      rec.의사_의사ID := :OLD.의사_의사ID; 
      rec.간호사_간호사ID := :OLD.간호사_간호사ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 환자_JN VALUES rec; 
  END; 
  /ALTER TABLE 간호사
    ADD CONSTRAINT 간호사_차트_fk FOREIGN KEY ( 차트_차트번호 )
        REFERENCES 차트 ( 차트번호 );

ALTER TABLE 진료
    ADD CONSTRAINT 진료_의사_fk FOREIGN KEY ( 의사_의사id )
        REFERENCES 의사 ( 의사id );

ALTER TABLE 차트
    ADD CONSTRAINT 차트_진료_fk FOREIGN KEY ( 진료_진료id )
        REFERENCES 진료 ( 진료id );

ALTER TABLE 환자
    ADD CONSTRAINT 환자_간호사_fk FOREIGN KEY ( 간호사_간호사id )
        REFERENCES 간호사 ( 간호사id );

ALTER TABLE 환자
    ADD CONSTRAINT 환자_의사_fk FOREIGN KEY ( 의사_의사id )
        REFERENCES 의사 ( 의사id );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
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
