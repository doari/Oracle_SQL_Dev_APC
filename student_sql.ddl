-- 생성자 Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   위치:        2023-08-17 15:56:09 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE 강좌 (
    강좌번호 NUMBER NOT NULL
);

ALTER TABLE 강좌 ADD CONSTRAINT 강좌_pk PRIMARY KEY ( 강좌번호 );


CREATE TABLE 강좌_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,강좌번호 NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER 강좌_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 강좌 for each row 
 Declare 
  rec 강좌_JN%ROWTYPE; 
  blank 강좌_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.강좌번호 := :NEW.강좌번호; 
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
      rec.강좌번호 := :OLD.강좌번호; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 강좌_JN VALUES rec; 
  END; 
  /CREATE TABLE 교수 (
    교수번호    NUMBER NOT NULL,
    학과번호    NUMBER,
    학과_학과번호 NUMBER NOT NULL,
    강좌번호    NUMBER,
    강좌_강좌번호 NUMBER NOT NULL
);

ALTER TABLE 교수 ADD CONSTRAINT 교수_pk PRIMARY KEY ( 교수번호 );


CREATE TABLE 교수_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,교수번호 NUMBER NOT NULL
 ,학과번호 NUMBER
 ,학과_학과번호 NUMBER NOT NULL
 ,강좌번호 NUMBER
 ,강좌_강좌번호 NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER 교수_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 교수 for each row 
 Declare 
  rec 교수_JN%ROWTYPE; 
  blank 교수_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.교수번호 := :NEW.교수번호; 
      rec.학과번호 := :NEW.학과번호; 
      rec.학과_학과번호 := :NEW.학과_학과번호; 
      rec.강좌번호 := :NEW.강좌번호; 
      rec.강좌_강좌번호 := :NEW.강좌_강좌번호; 
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
      rec.교수번호 := :OLD.교수번호; 
      rec.학과번호 := :OLD.학과번호; 
      rec.학과_학과번호 := :OLD.학과_학과번호; 
      rec.강좌번호 := :OLD.강좌번호; 
      rec.강좌_강좌번호 := :OLD.강좌_강좌번호; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 교수_JN VALUES rec; 
  END; 
  /CREATE TABLE 수강내역 (
    학생번호    NUMBER NOT NULL,
    강좌번호    NUMBER,
    과목코드    NVARCHAR2(20) NOT NULL,
    강좌_강좌번호 NUMBER NOT NULL,
    학생_학생번호 NUMBER NOT NULL
);

ALTER TABLE 수강내역 ADD CONSTRAINT 수강내역_pk PRIMARY KEY ( 과목코드 );


CREATE TABLE 수강내역_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,학생번호 NUMBER NOT NULL
 ,강좌번호 NUMBER
 ,과목코드 NVARCHAR2 (20) NOT NULL
 ,강좌_강좌번호 NUMBER NOT NULL
 ,학생_학생번호 NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER 수강내역_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 수강내역 for each row 
 Declare 
  rec 수강내역_JN%ROWTYPE; 
  blank 수강내역_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.학생번호 := :NEW.학생번호; 
      rec.강좌번호 := :NEW.강좌번호; 
      rec.과목코드 := :NEW.과목코드; 
      rec.강좌_강좌번호 := :NEW.강좌_강좌번호; 
      rec.학생_학생번호 := :NEW.학생_학생번호; 
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
      rec.학생번호 := :OLD.학생번호; 
      rec.강좌번호 := :OLD.강좌번호; 
      rec.과목코드 := :OLD.과목코드; 
      rec.강좌_강좌번호 := :OLD.강좌_강좌번호; 
      rec.학생_학생번호 := :OLD.학생_학생번호; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 수강내역_JN VALUES rec; 
  END; 
  /CREATE TABLE 학과 (
    학과번호 NUMBER NOT NULL
);

ALTER TABLE 학과 ADD CONSTRAINT 학과_pk PRIMARY KEY ( 학과번호 );


CREATE TABLE 학과_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,학과번호 NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER 학과_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 학과 for each row 
 Declare 
  rec 학과_JN%ROWTYPE; 
  blank 학과_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.학과번호 := :NEW.학과번호; 
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
      rec.학과번호 := :OLD.학과번호; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 학과_JN VALUES rec; 
  END; 
  /CREATE TABLE 학생 (
    학생번호    NUMBER NOT NULL,
    교수번호    NUMBER,
    학과번호    NUMBER,
    학과_학과번호 NUMBER NOT NULL,
    교수_교수번호 NUMBER NOT NULL
);

ALTER TABLE 학생 ADD CONSTRAINT 학생_pk PRIMARY KEY ( 학생번호 );


CREATE TABLE 학생_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,학생번호 NUMBER NOT NULL
 ,교수번호 NUMBER
 ,학과번호 NUMBER
 ,학과_학과번호 NUMBER NOT NULL
 ,교수_교수번호 NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER 학생_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON 학생 for each row 
 Declare 
  rec 학생_JN%ROWTYPE; 
  blank 학생_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.학생번호 := :NEW.학생번호; 
      rec.교수번호 := :NEW.교수번호; 
      rec.학과번호 := :NEW.학과번호; 
      rec.학과_학과번호 := :NEW.학과_학과번호; 
      rec.교수_교수번호 := :NEW.교수_교수번호; 
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
      rec.학생번호 := :OLD.학생번호; 
      rec.교수번호 := :OLD.교수번호; 
      rec.학과번호 := :OLD.학과번호; 
      rec.학과_학과번호 := :OLD.학과_학과번호; 
      rec.교수_교수번호 := :OLD.교수_교수번호; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into 학생_JN VALUES rec; 
  END; 
  /ALTER TABLE 교수
    ADD CONSTRAINT 교수_강좌_fk FOREIGN KEY ( 강좌_강좌번호 )
        REFERENCES 강좌 ( 강좌번호 );

ALTER TABLE 교수
    ADD CONSTRAINT 교수_학과_fk FOREIGN KEY ( 학과_학과번호 )
        REFERENCES 학과 ( 학과번호 );

ALTER TABLE 수강내역
    ADD CONSTRAINT 수강내역_강좌_fk FOREIGN KEY ( 강좌_강좌번호 )
        REFERENCES 강좌 ( 강좌번호 );

ALTER TABLE 수강내역
    ADD CONSTRAINT 수강내역_학생_fk FOREIGN KEY ( 학생_학생번호 )
        REFERENCES 학생 ( 학생번호 );

ALTER TABLE 학생
    ADD CONSTRAINT 학생_교수_fk FOREIGN KEY ( 교수_교수번호 )
        REFERENCES 교수 ( 교수번호 );

ALTER TABLE 학생
    ADD CONSTRAINT 학생_학과_fk FOREIGN KEY ( 학과_학과번호 )
        REFERENCES 학과 ( 학과번호 );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
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
