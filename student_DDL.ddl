-- ������ Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   ��ġ:        2023-08-17 15:54:42 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ���� (
    ���¹�ȣ NUMBER NOT NULL
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ���¹�ȣ );

CREATE TABLE ���� (
    ������ȣ    NUMBER NOT NULL,
    �а���ȣ    NUMBER,
    �а�_�а���ȣ NUMBER NOT NULL,
    ���¹�ȣ    NUMBER,
    ����_���¹�ȣ NUMBER NOT NULL
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ������ȣ );

CREATE TABLE �������� (
    �л���ȣ    NUMBER NOT NULL,
    ���¹�ȣ    NUMBER,
    �����ڵ�    NVARCHAR2(20) NOT NULL,
    ����_���¹�ȣ NUMBER NOT NULL,
    �л�_�л���ȣ NUMBER NOT NULL
);

ALTER TABLE �������� ADD CONSTRAINT ��������_pk PRIMARY KEY ( �����ڵ� );

CREATE TABLE �а� (
    �а���ȣ NUMBER NOT NULL
);

ALTER TABLE �а� ADD CONSTRAINT �а�_pk PRIMARY KEY ( �а���ȣ );

CREATE TABLE �л� (
    �л���ȣ    NUMBER NOT NULL,
    ������ȣ    NUMBER,
    �а���ȣ    NUMBER,
    �а�_�а���ȣ NUMBER NOT NULL,
    ����_������ȣ NUMBER NOT NULL
);

ALTER TABLE �л� ADD CONSTRAINT �л�_pk PRIMARY KEY ( �л���ȣ );

ALTER TABLE ����
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
