/*This creates the buyers table*/
CREATE TABLE BUYERS (
   ACCOUNT_NUMBER NUMBER(5) PRIMARY KEY,
   BUYER_NAME VARCHAR(30),
   BUYER_ADDRESS VARCHAR(50),
   BUYER_PHONE_NUMBER NUMBER(10),
   BUYER_EMAIL VARCHAR(30),
   OCCUPATION VARCHAR(30),
   SALARY NUMBER(7),
   CREDIT_SCORE NUMBER(3)
)
 /*This creates the agreements table*/ CREATE TABLE AGREEMENTS (
   AGREEMENT_NUMBER NUMBER(5, 0),
   AGREEMENT_DESC VARCHAR2(50),
   PRIMARY KEY (AGREEMENT_NUMBER)
)
 /*This creates the contractors table*/ CREATE TABLE CONTRACTORS (
   CONTRACTOR_ID NUMBER(5, 0),
   CONRACTOR_NAME VARCHAR2(30),
   CONTRACTOR_ADDRESS VARCHAR2(50),
   CONTRACTOR_PHONE_NUMBER NUMBER(10, 0),
   PRIMARY KEY (CONTRACTOR_ID)
)
 /*This creates the properties table*/ CREATE TABLE PROPERTIES (
   PARCEL_NUMBER NUMBER(5, 0),
   PROPERTY_ADDRESS VARCHAR2(50),
   ROOM_NUMBER NUMBER(2, 0),
   SQUARE_FOOT NUMBER(5, 0),
   PURCHASE_DATE DATE,
   PURCAHSE_AMOUNT NUMBER(7, 0),
   MARKET_VALUE NUMBER(7, 0),
   ARCHITECTURE_STYLE VARCHAR2(30),
   ARCHITECTURE_DESC VARCHAR2(30),
   PRIMARY KEY (PARCEL_NUMBER)
)
 /*This creates the sales_agents table*/ CREATE TABLE SALES_AGENTS (
   SALES_AGENT_ID NUMBER(5, 0),
   SALES_AGENT_NAME VARCHAR2(30),
   SALES_AGENT_PHONE_NUMBER NUMBER(10, 0),
   SALES_AGENT_ADDRESS VARCHAR2(50),
   PRIMARY KEY (SALES_AGENT_ID)
)
 /*This creates the contractor_agreement table and adds its constraints*/ CREATE TABLE CONTRACTOR_AGREEMENT (
   AGREEMENT_NUMBER NUMBER(5),
   CONTRACTOR_ID NUMBER(5),
   CONSTRAINT CA PRIMARY KEY (AGREEMENT_NUMBER, CONTRACTOR_ID)
);

/*This adds the constraints for the contractor_agreement table*/
ALTER TABLE CONTRACTOR_AGREEMENT
   ADD FOREIGN KEY (
      AGREEMENT_NUMBER
   )
      REFERENCES AGREEMENTS (
         AGREEMENT_NUMBER
      ) ALTER TABLE CONTRACTOR_AGREEMENT ADD FOREIGN KEY (
         CONTRACTOR_ID
      )
         REFERENCES CONTRACTORS (
            CONTRACTOR_ID
         )
 /*This creates the property_sales table*/ CREATE TABLE PROPERTY_SALES (
            ACCOUNT_NUMBER NUMBER(5),
            PARCEL_NUMBER NUMBER(5),
            SALES_AGENT_ID NUMBER(5),
            EMPLOYEE_CODE NUMBER(5)
         );

/*This adds the constrainst for the property_sales table*/
ALTER TABLE PROPERTY_SALES
   ADD CONSTRAINT PS PRIMARY KEY (
      ACCOUNT_NUMBER,
      PARCEL_NUMBER,
      SALES_AGENT_ID,
      EMPLOYEE_CODE
   ) ALTER TABLE PROPERTY_SALES ADD FOREIGN KEY (
      ACCOUNT_NUMBER
   )
      REFERENCES BUYERS(
         ACCOUNT_NUMBER
      ) ALTER TABLE PROPERTY_SALES ADD FOREIGN KEY (
         PARCEL_NUMBER
      )
         REFERENCES PROPERTIES(
            PARCEL_NUMBER
         ) ALTER TABLE PROPERTY_SALES ADD FOREIGN KEY (
            SALES_AGENT_ID
         )
            REFERENCES SALES_AGENTS(
               SALES_AGENT_ID
            ) ALTER TABLE PROPERTY_SALES ADD FOREIGN KEY (
               EMPLOYEE_CODE
            )
               REFERENCES EMPLOYEES(
                  EMPLOYEE_CODE
               )
 /*This inserts the data for all the tables*/ INSERT INTO BUYERS VALUES (
                  10000,
                  'James Bell',
                  '45 Pin Oak Lane, Indianapolis,IN 46107',
                  3171234567,
                  'jb@gmail.com',
                  'Construction Manager',
                  72000,
                  700
               );

INSERT INTO BUYERS VALUES (
   10001,
   'Mark Jones',
   '127 Trenton Avenue, Indianapolis, IN 46107',
   3170001234,
   'markj@gmail.com',
   'Mechanic',
   46000,
   630
);

INSERT INTO BUYERS VALUES (
   10002,
   'Chris Thompson',
   '946 Pin Oak Rd, Indianapolis, IN 46107',
   3171012200,
   'ct@gmail.com',
   'Computer Support',
   57000,
   689
);

INSERT INTO BUYERS VALUES (
   10003,
   'Mike Washington',
   '7079 Thorne Drive, Indianapolis, IN 46107',
   3172001000,
   'mw@gmail.com',
   'Human Resources',
   70000,
   690
);

INSERT INTO BUYERS VALUES (
   10004,
   'Jake Brown',
   '68 House Ave, Indianapolis, IN 46107',
   3174501831,
   'jakebrown@gmail.com',
   'Finance Manager',
   151000,
   730
);

INSERT INTO EMPLOYEES VALUES (
   12345,
   'Mike Jones',
   3173210001,
   '711 Broad Lane, Indianapolis, IN 46107',
   'Accountant'
);

INSERT INTO EMPLOYEES VALUES (
   12346,
   'Mary Johnson',
   3178120425,
   '778 Sierra St, Indianapolis, IN 46107',
   'Lawyer'
);

INSERT INTO EMPLOYEES VALUES (
   12347,
   'John Williams',
   3176191221,
   '9741 Lakeshore Drive, Indianapolis, IN 46107',
   'Secretary'
);

INSERT INTO EMPLOYEES VALUES (
   12348,
   'Michael Smith',
   3177652345,
   '323 Second Ave, Indianapolis, IN 46107',
   'Maitenance'
);

INSERT INTO EMPLOYEES VALUES (
   12349,
   'Jessica Jones',
   3177652345,
   '891 William Rd, Indianapolis, IN 46107',
   'Maitenance'
);

INSERT INTO PROPERTY_SALES VALUES (
   10000,
   23456,
   11112,
   12345
);

INSERT INTO PROPERTY_SALES VALUES (
   10001,
   23457,
   11113,
   12346
);

INSERT INTO PROPERTY_SALES VALUES (
   10002,
   23458,
   11114,
   12347
);

INSERT INTO PROPERTY_SALES VALUES (
   10003,
   23459,
   11115,
   12348
);

INSERT INTO PROPERTY_SALES VALUES (
   10004,
   23460,
   11116,
   12349
);

INSERT INTO CONTRACTOR_AGREEMENT VALUES (
   18312,
   13456
);

INSERT INTO CONTRACTOR_AGREEMENT VALUES (
   18313,
   13457
);

INSERT INTO CONTRACTOR_AGREEMENT VALUES (
   18314,
   13458
);

INSERT INTO CONTRACTOR_AGREEMENT VALUES (
   18315,
   13459
);

INSERT INTO CONTRACTOR_AGREEMENT VALUES (
   18316,
   13450
);

INSERT INTO SALES_AGENTS VALUES (
   11112,
   'Charles Klein',
   3177656758,
   '232 Arrowhead Ave, Indianapolis, IN 46107'
);

INSERT INTO SALES_AGENTS VALUES (
   11113,
   'Josh Clark',
   3178901100,
   '568 Acacia Drive, Indianapolis, IN 46107'
);

INSERT INTO SALES_AGENTS VALUES (
   11114,
   'Jackson Moore',
   3172681357,
   '966 Homestead St, Indianapolis, IN 46107'
);

INSERT INTO SALES_AGENTS VALUES (
   11115,
   'Kevin Wilson',
   3174403765,
   '152 Cottage Drive, Indianapolis, IN 46107'
);

INSERT INTO SALES_AGENTS VALUES (
   11116,
   'Cynthia Anderson',
   3179189021,
   '7538 Green Hill Court, Indianapolis, In 46107'
);

INSERT INTO PROPERTIES VALUES (
   23456,
   '676 Vine Ave, Indianapolis, IN 46107',
   3,
   2000,
   1/25/20,
   125000,
   150000,
   'Colonial',
   'Built in 1910'
);

INSERT INTO PROPERTIES VALUES (
   23457,
   '9868 Creek Ave, Indianapolis, IN 46107',
   2,
   1300,
   11/15/20,
   86000,
   90000,
   'Cape Cod',
   'Built in 1925'
);

INSERT INTO PROPERTIES VALUES (
   23458,
   '844 Greystone Court, Indianapolis, IN 46107',
   2,
   1400,
   5/7/20,
   91000,
   87000,
   'Ranch',
   'Built in 1980'
);

INSERT INTO PROPERTIES VALUES (
   23459,
   '770 Swanson St, Indianapolis, IN 46107',
   4,
   2500,
   9/7/21,
   200000,
   210000,
   'Craftsman',
   'Built in 2005'
);

INSERT INTO PROPERTIES VALUES (
   23460,
   '9818 Summit St, Indianapolis, IN 46107',
   5,
   3000,
   2/5/21,
   275000,
   260,
   000,
   'Modern',
   'Built in 2011'
);