-- 생성자 Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   위치:        2023-08-17 15:54:42 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE 강좌 (
    강좌번호 NUMBER NOT NULL
);

ALTER TABLE 강좌 ADD CONSTRAINT 강좌_pk PRIMARY KEY ( 강좌번호 );

CREATE TABLE 교수 (
    교수번호    NUMBER NOT NULL,
    학과번호    NUMBER,
    학과_학과번호 NUMBER NOT NULL,
    강좌번호    NUMBER,
    강좌_강좌번호 NUMBER NOT NULL
);

ALTER TABLE 교수 ADD CONSTRAINT 교수_pk PRIMARY KEY ( 교수번호 );

CREATE TABLE 수강내역 (
    학생번호    NUMBER NOT NULL,
    강좌번호    NUMBER,
    과목코드    NVARCHAR2(20) NOT NULL,
    강좌_강좌번호 NUMBER NOT NULL,
    학생_학생번호 NUMBER NOT NULL
);

ALTER TABLE 수강내역 ADD CONSTRAINT 수강내역_pk PRIMARY KEY ( 과목코드 );

CREATE TABLE 학과 (
    학과번호 NUMBER NOT NULL
);

ALTER TABLE 학과 ADD CONSTRAINT 학과_pk PRIMARY KEY ( 학과번호 );

CREATE TABLE 학생 (
    학생번호    NUMBER NOT NULL,
    교수번호    NUMBER,
    학과번호    NUMBER,
    학과_학과번호 NUMBER NOT NULL,
    교수_교수번호 NUMBER NOT NULL
);

ALTER TABLE 학생 ADD CONSTRAINT 학생_pk PRIMARY KEY ( 학생번호 );

ALTER TABLE 교수
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
