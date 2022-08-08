--Anlitiks FULL UPDATE QUARTERLY
--explain using tabular


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_DIAGNOSIS_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_NUMBER),256) as CLAIM_NUMBER,
	a.RECEIVED_DATE,
	L_DIAGNOSIS_SEQUENCE_CODE,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
    --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	DATE_OF_SERVICE,
	D_DIAGNOSIS_CODE,
	L_DIAGNOSIS_CODE_TYPE,
	MAXIMUM_SERVICE_TO_DATE,
	MINIMUM_SERVICE_FROM_DATE,
	STATEMENT_FROM_DATE,
	STATEMENT_TO_DATE,
	MINIMUM_SERVICE_FROM_DATE_HEADER,
	L_CLAIM_TYPE_CODE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	a.EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_CLAIM_DIAGNOSIS a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
AND PATIENT_TOKEN_1 IS NOT NULL
AND PATIENT_TOKEN_2 IS NOT NULL
AND PATIENT_TOKEN_1 NOT LIKE 'XXX -'
AND PATIENT_TOKEN_2 NOT LIKE 'XXX -'; 


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_HEADER_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_NUMBER),256) as CLAIM_NUMBER,
	RECEIVED_DATE,
	TRANSACTION_ID,
	ADMISSION_DATE,
	L_ADMIT_SOURCE_CODE,
	L_ADMIT_TYPE_CODE,
	L_CLAIM_TYPE_CODE,
	L_DISCHARGE_STATUS,
	L_DRG_CODE,
	PROCESSOR_TS,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
    --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	MAXIMUM_SERVICE_TO_DATE,
	MINIMUM_SERVICE_FROM_DATE,
	STATEMENT_FROM_DATE,
	STATEMENT_TO_DATE,
	TOTAL_CHARGE,
	L_TYPE_OF_BILL,
	DATE_OF_SERVICE,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	a.EXTRACT_DATE,
	NEW_MEDICARE_SOURCE_INDICATOR
FROM SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_CLAIM_HEADER a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
AND PATIENT_TOKEN_1 IS NOT NULL
AND PATIENT_TOKEN_2 IS NOT NULL
AND PATIENT_TOKEN_1 NOT LIKE 'XXX -'
AND PATIENT_TOKEN_2 NOT LIKE 'XXX -'; 


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PATIENT_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_NUMBER),256) as CLAIM_NUMBER,
	received_date,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
    --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	GENDER_CODE,
    ZIP3,
    BIRTH_YEAR,
	SUBSCRIBER_ADDRESS_STATE,
	SUBSCRIBER_ADDRESS_ZIP3,
	L_SUBSCRIBER_PATIENT_RELATIONSHIP_CODE,
    SUBSCRIBER_TOKEN_1||SUBSCRIBER_TOKEN_2 AS FORIAN_SUBSCRIBER_ID,
	PAYER_SEQUENCE,
	DATE_OF_SERVICE,
	MINIMUM_SERVICE_FROM_DATE_HEADER,
	L_CLAIM_TYPE_CODE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_CLAIM_PATIENT a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
AND PATIENT_TOKEN_1 IS NOT NULL
AND PATIENT_TOKEN_2 IS NOT NULL
AND PATIENT_TOKEN_1 NOT LIKE 'XXX -'
AND PATIENT_TOKEN_2 NOT LIKE 'XXX -'; 


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PAYER_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_NUMBER), 256) AS CLAIM_NUMBER,
	RECEIVED_DATE,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
    --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	PAYER_ID,
	PAYER_NAME,
	PAYER_STATE,
	L_TYPE_OF_COVERAGE_CODE,
	DATE_OF_SERVICE,
	MINIMUM_SERVICE_FROM_DATE_HEADER,
	L_CLAIM_TYPE_CODE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PAYER_SEQUENCE,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	a.EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_CLAIM_PAYER a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
AND PATIENT_TOKEN_1 IS NOT NULL
AND PATIENT_TOKEN_2 IS NOT NULL
AND PATIENT_TOKEN_1 NOT LIKE 'XXX -'
AND PATIENT_TOKEN_2 NOT LIKE 'XXX -'; 


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PROCEDURE_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_NUMBER), 256) AS CLAIM_NUMBER,
	RECEIVED_DATE,
	LINE_NUMBER,
	D_PROCEDURE_CODE,
	DATE_OF_SERVICE,
	DIAGNOSIS_POINTER_1,
	DIAGNOSIS_POINTER_2,
	DIAGNOSIS_POINTER_3,
	DIAGNOSIS_POINTER_4,
	DIAGNOSIS_POINTER_5,
	DIAGNOSIS_POINTER_6,
	DIAGNOSIS_POINTER_7,
	DIAGNOSIS_POINTER_8,
	DIAGNOSIS_POINTER_9,
	DIAGNOSIS_POINTER_10,
	DIAGNOSIS_POINTER_11,
	DIAGNOSIS_POINTER_12,
	EMERGENCY_INDICATOR,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
    --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	LINE_CHARGE,
	NDC,
	L_PLACE_OF_SERVICE_CODE,
	PROCEDURE_MODIFIER_1,
	PROCEDURE_MODIFIER_2,
	PROCEDURE_MODIFIER_3,
	PROCEDURE_MODIFIER_4,
	PROCEDURE_QUALIFIER,
	PROCEDURE_SEQUENCE,
	L_PROCEDURE_TYPE_CODE,
	D_RENDERING_PROVIDER_NPI,
	L_REVENUE_CODE,
	SERVICE_FROM_DATE,
	SERVICE_TO_DATE,
	STATEMENT_FROM_DATE,
	STATEMENT_TO_DATE,
	L_TYPE_OF_SERVICE_CODE,
	UNITS_BILLED,
	MINIMUM_SERVICE_FROM_DATE_HEADER,
	L_CLAIM_TYPE_CODE,
	SERUM_CREATININE_DATE,
	HEMOGLOBIN_HEMATOCRIT_DATE,
	HEMOGLOBIN_TEST_RESULT,
	HEMATOCRIT_TEST_RESULT,
	EPOETIN_TEST_RESULT,
	CREATININE_TEST_RESULT,
	D_LAB_PROVIDER_NPI,
	UPC AS UPC_CODE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_CLAIM_PROCEDURE a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
AND PATIENT_TOKEN_1 IS NOT NULL
AND PATIENT_TOKEN_2 IS NOT NULL
AND PATIENT_TOKEN_1 NOT LIKE 'XXX -'
AND PATIENT_TOKEN_2 NOT LIKE 'XXX -'; 


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PROVIDER_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_NUMBER), 256) AS CLAIM_NUMBER,
	RECEIVED_DATE,
	PROVIDER_ROLE,
	NAME_1,
	ADDRESS_LINE_1,
	NAME_2,
	ADDRESS_LINE_2,
	CITY,
	STATE,
	ZIP,
	ENTITY_TYPE_CODE,
	PROVIDER_NPI,
	TAXONOMY_CODE_FROM_CLAIM,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
   --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	OTHER_PROVIDER_ID,
 	DATE_OF_SERVICE,
	MINIMUM_SERVICE_FROM_DATE_HEADER,
  	L_CLAIM_TYPE_CODE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	a.EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_CLAIM_PROVIDER a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
AND PATIENT_TOKEN_1 IS NOT NULL
AND PATIENT_TOKEN_2 IS NOT NULL
AND PATIENT_TOKEN_1 NOT LIKE 'XXX -'
AND PATIENT_TOKEN_2 NOT LIKE 'XXX -'; 



CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CONNECTION_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_NUMBER),256) AS CLAIM_NUMBER,
	SHA2(CONCAT('dGS$T8AD', CLAIM_PAYMENT_NUMBER),256) AS CLAIM_PAYMENT_NUMBER,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
    --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	STATEMENT_OR_SERVICE_FROM_DATE,
	STATEMENT_OR_SERVICE_TO_DATE,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	a.EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_REMITTANCE_CONNECTION a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
AND PATIENT_TOKEN_1 IS NOT NULL
AND PATIENT_TOKEN_2 IS NOT NULL
AND PATIENT_TOKEN_1 NOT LIKE 'XXX -'
AND PATIENT_TOKEN_2 NOT LIKE 'XXX -'; 




CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CLAIM_ADJUSTMENT_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_PAYMENT_NUMBER),256) AS CLAIM_PAYMENT_NUMBER,
	L_ADJUSTMENT_GROUP_CODE,
	L_ADJUSTMENT_REASON_CODE,
	ADJUSTMENT_AMOUNT,
	ADJUSTMENT_QUANTITY,
	TRANSACTION_ID
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_REMITTANCE_CLAIM_ADJUSTMENT
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
; 



CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CLAIM_PAYMENT_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_PAYMENT_NUMBER),256) AS CLAIM_PAYMENT_NUMBER,
	SHA2(CONCAT('dGS$T8AD', PATIENT_IDENTIFIER),256) AS PATIENT_IDENTIFIER,
	PATIENT_CONTROL_NUMBER,
	L_CLAIM_STATUS_CODE,
	TOTAL_CLAIM_CHARGE_AMOUNT,
	TOTAL_PAID_AMOUNT,
	PATIENT_RESPONSIBILITY_AMOUNT,
	L_CLAIM_FILING_INDICATOR_CODE,
	PAYER_CLAIM_CONTROL_NUMBER,
	L_FACILITY_TYPE_CODE,
	CLAIM_FREQUENCY_CODE,
	L_DRG_CODE,
	DRG_WEIGHT,
	PATIENT_PAID_AMOUNT,
	COVERAGE_AMOUNT,
	DISCHARGE_FRACTION,
	PAYER_IDENTIFIER,
	PAYER_IDENTIFIER_QUALIFIER,
	RENDERING_PROVIDER_ORGANIZATION_IDENTIFICATION_CODE_QUALIFIER ,
	RENDERING_PROVIDER_ORGANIZATION_IDENTIFIER ,
	RENDERING_PROVIDER_LAST_OR_ORGANIZATION_NAME ,
	RENDERING_PROVIDER_FIRST_NAME,
	RENDERING_PROVIDER_MIDDLE_NAME,
	RENDERING_PROVIDER_NAME_SUFFIX ,
	RENDERING_PROVIDER_PRACTITIONER_IDENTIFICATION_CODE_QUALIFIER ,
	RENDERING_PROVIDER_PRACTITIONER_IDENTIFIER ,
	CLAIM_STATEMENT_PERIOD_START_DATE_QUALIFIER,
	CLAIM_STATEMENT_PERIOD_START_DATE ,
	MINIMUM_SERVICE_FROM_DATE ,
	CLAIM_STATEMENT_PERIOD_END_DATE_QUALIFIER ,
	CLAIM_STATEMENT_PERIOD_END_DATE,
	MAXIMUM_SERVICE_TO_DATE,
	COVERAGE_EXPIRATION_DATE_QUALIFIER ,
	COVERAGE_EXPIRATION_DATE,
	CLAIM_RECEIVED_DATE_QUALIFIER ,
	CLAIM_RECEIVED_DATE,
	CLAIM_CONTACT_FUNCTION_CODE e,
	CLAIM_CONTACT_NAME,
	CLAIM_CONTACT_COMMUNICATIONS_PHONE_NUMBER,
	CLAIM_CONTACT_COMMUNICATIONS_EMAIL,
	CLAIM_CONTACT_COMMUNICATIONS_FAX,
	PRODUCTION_DATE,
	PRODUCTION_DATE_QUALIFIER,
	CHECK_ISSUE_OR_EFT_EFFECTIVE_DATE,
	PAYER_TAX_ID,
	PAYER_NAME,
	PAYER_IDENTIFICATION_CODE_QUALIFIER ,
	PAYER_IDENTIFICATION_CODE,
	TSPID,
	PAYER_ADDRESS_LINE_1 ,
	PAYER_ADDRESS_LINE_2,
	PAYER_CITY_NAME,
	PAYER_STATE_CODE,
	PAYER_POSTAL_ZONE_OR_ZIP_CODE,
	ADDITIONAL_PAYER_IDENTIFIER_MEDICARE_OR_BCBS,
	SUBMITTER_IDENTIFICATION_NUMBER,
	ADDITIONAL_PAYER_IDENTIFIER_HIN ,
	ADDITIONAL_PAYER_IDENTIFIER_NAIC ,
	BUSINESS_CONTACT_NAME,
	BUSINESS_CONTACT_COMMUNICATIONS_PHONE_NUMBER,
	BUSINESS_CONTACT_COMMUNICATIONS_EMAIL ,
	BUSINESS_CONTACT_COMMUNICATIONS_FAX ,
	BUSINESS_CONTACT_FUNCTION_CODE,
	PAYER_ENTITY_IDENTIFIER_CODE,
	PAYEE_NAME,
	PAYEE_IDENTIFICATION_CODE_QUALIFIER,
	PAYEE_IDENTIFICATION_CODE,
	PAYEE_ADDRESS_LINE_1,
	PAYEE_ADDRESS_LINE_2,
	PAYEE_CITY_NAME,
	PAYEE_STATE_CODE,
	PAYEE_POSTAL_ZONE_OR_ZIP_CODE,
	PAYEE_STATE_LICENSE_NUMBER,
	PAYEE_NCPDP_PHARMACY_NUMBER,
	PAYEE_ADDITIONAL_IDENTIFIER,
	PAYEE_FEDERAL_TAXPAYER_IDENTIFICATION_NUMBER,
	PAYEE_ENTITY_IDENTIFIER_CODE,
	PAYEE_COUNTRY_CODE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_REMITTANCE_CLAIM_PAYMENT
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
; 



CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_COB_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_PAYMENT_NUMBER),256) AS CLAIM_PAYMENT_NUMBER,
	CROSSOVER_CARRIER_NAME,
	CROSSOVER_CARRIER_IDENTIFICATION_CODE_QUALIFIER ,
	CROSSOVER_CARRIER_IDENTIFIER ,
	CORRECTED_PRIORITY_PAYER_NAME ,
	CORRECTED_PRIORITY_PAYER_IDENTIFICATION_CODE_QUALIFIER ,
	CORRECTED_PRIORITY_PAYER_IDENTIFICATION_NUMBER ,
	CROSSOVER_CARRIER_ENTITY_IDENTIFICATION_CODE,
	CROSSOVER_CARRIER_ENTITY_TYPE_QUALIFIER ,
	CROSSOVER_CARRIER_PRODUCTION_DATE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_REMITTANCE_COB
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
; 



CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_SERVICE_ADJUSTMENT_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_PAYMENT_NUMBER),256)AS CLAIM_PAYMENT_NUMBER,
	LINE_ITEM_CONTROL_NUMBER,
	L_ADJUSTMENT_GROUP_CODE,
	L_ADJUSTMENT_REASON_CODE,
	ADJUSTMENT_AMOUNT,
	ADJUSTMENT_QUANTITY,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_REMITTANCE_SERVICE_ADJUSTMENT
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
; 


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_SERVICE_PAYMENT_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', CLAIM_PAYMENT_NUMBER),256) AS CLAIM_PAYMENT_NUMBER,
	LINE_ITEM_CONTROL_NUMBER,
	L_ADJUDICATED_PRODUCT_OR_SERVICE_ID_QUALIFIER,
	ADJUDICATED_PROCEDURE_CODE,
	ADJUDICATED_PROCEDURE_MODIFIER_1,
	ADJUDICATED_PROCEDURE_MODIFIER_2,
	ADJUDICATED_PROCEDURE_MODIFIER_3,
	ADJUDICATED_PROCEDURE_MODIFIER_4,
	LINE_ITEM_CHARGE_AMOUNT,
	LINE_ITEM_PROVIDER_PAYMENT_AMOUNT,
	LINE_ITEM_ALLOWED_AMOUNT,
	NUBC_REVENUE_CODE,
	UNITS_OF_SERVICE_PAID_COUNT,
	SUBMITTED_PROCEDURE_CODE_QUALIFIER,
	SUBMITTED_PROCEDURE_CODE,
	SUBMITTED_PROCEDURE_MODIFIER_1,
	SUBMITTED_PROCEDURE_MODIFIER_2,
	SUBMITTED_PROCEDURE_MODIFIER_3,
	SUBMITTED_PROCEDURE_MODIFIER_4,
	ORIGINAL_UNITS_OF_SERVICE_COUNT,
	SERVICE_DATETIME_QUALIFIER,
	SERVICE_PERIOD_START_DATE,
	SERVICE_PERIOD_END_DATE,
	SERVICE_PAYMENT_INFORMATION_PAID_DATE,
	PAYMENT_DATE,
	TRANSACTION_ID,
	CREATE_TS,
	UPDATE_TS,
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
FROM
	SILVER_DF1.FORIAN.MEDICAL_HOSPITAL_REMITTANCE_SERVICE_PAYMENT
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
; 


CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_PHARMACY_TRANSACTION_20220627 AS
SELECT
	SHA2(CONCAT('dGS$T8AD', TRANSACTION_ID), 256) AS TRANSACTION_ID,
	DATE_OF_SERVICE,
	D_SERVICE_PROVIDER_ID,
	SERVICE_PROVIDER_TAXONOMY_CODE,
	PRESCRIPTION_OR_SERVICE_REFERENCE_NUMBER,
	(SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_1),256)||SHA2(CONCAT('dGS$T8AD', PATIENT_TOKEN_2),256)) as forian_patient_id,
    --client_transient_patient_token_1 as PATIENT_TOKEN_1,
    --client_transient_patient_token_2 as PATIENT_TOKEN_2,
	NDC,
	D_PRESCRIBER_ID,
	D_BIN,
	FILL_NUMBER,
	GROUP_ID,
	AMOUNT_EXCEEDING_PERIODIC_BENEFIT_MAXIMUM,
	AMOUNT_OF_COPAY_OR_COINSURANCE,
	L_BASIS_OF_COST_DETERMINATION,
	L_BASIS_OF_REIMBURSEMENT_DETERMINATION,
	SHA2(CONCAT('dGS$T8AD', claim_number), 256) AS CLAIM_NUMBER,
	COORDINATION_OF_BENEFITS_COUNT,
	COUPON_VALUE_AMOUNT,
	DATE_PRESCRIPTION_WRITTEN,
	DAYS_SUPPLY,
	D_DIAGNOSIS_CODE,
	L_DISPENSE_AS_WRITTEN_DAW_PRODUCT_SELECTION_CODE,
	DISPENSING_FEE_PAID,
	DISPENSING_FEE_SUBMITTED,
	FLAT_SALES_TAX_AMOUNT_PAID,
	GROSS_AMOUNT_DUE_SUBMITTED,
	INGREDIENT_COST_PAID,
	INGREDIENT_COST_SUBMITTED,
	L_LEVEL_OF_SERVICE,
	NUMBER_OF_REFILLS_AUTHORIZED,
	D_ORIGINALLY_PRESCRIBED_PRODUCT_OR_SERVICE_CODE,
	L_ORIGINALLY_PRESCRIBED_PRODUCT_OR_SERVICE_CODE_QUALIFIER,
	ORIGINALLY_PRESCRIBED_QUANTITY,
	L_OTHER_AMOUNT_CLAIMED_SUBMITTED_QUALIFIER,
	OTHER_PAYER_AMOUNT_RECOGNIZED,
	L_OTHER_PAYER_COVERAGE_TYPE,
	OTHER_PAYER_DATE,
	L_OTHER_NCPDP_PAYER_ID,
	L_PLACE_OF_SERVICE_CODE,
	PATIENT_PAID_AMOUNT_SUBMITTED,
	PATIENT_PAY_AMOUNT,
	PATIENT_STATE,
	PHARMACY_LOCATION_POSTAL_CODE,
	PLAN_ID,
	PLAN_NAME,
	L_PLAN_TYPE,
	L_PRESCRIBER_ID_QUALIFIER,
	PRESCRIBER_LAST_NAME,
	L_PRESCRIPTION_ORIGIN_CODE,
	L_PRIOR_AUTHORIZATION_TYPE_CODE,
	L_PRODUCT_OR_SERVICE_ID_QUALIFIER,
	D_PROVIDER_ID,
	L_PROVIDER_ID_QUALIFIER,
	QUANTITY_DISPENSED,
	L_REASON_FOR_SERVICE_CODE,
	L_REJECT_CODE_1,
	L_REJECT_CODE_2,
	L_REJECT_CODE_3,
	L_REJECT_CODE_4,
	L_REJECT_CODE_5,
	REMAINING_BENEFIT_AMOUNT,
	REMAINING_DEDUCTIBLE_AMOUNT,
	L_TRANSACTION_RESPONSE_STATUS,
	L_RESULT_OF_SERVICE_CODE,
	L_SERVICE_PROVIDER_ID_QUALIFIER,
	TOTAL_AMOUNT_PAID,
	L_TRANSACTION_CODE,
	TRANSACTION_COUNT,
	TYPE_OF_PAYMENT,
	L_SPECIAL_PACKAGING_INDICATOR,
	L_UNIT_OF_MEASURE,
	VERSION_NUMBER,
	CREATE_TS,
	L_FINAL_STATUS,
	PRESCRIPTION_SEQUENCE,
	COB_INDICATOR,
	PATIENT_ZIP3,                    
	PARTITION_DATE,
	YEAR AS PARTITION_YEAR,
	MONTH AS PARTITION_MONTH,
	DAY AS PARTITION_DAY,
	EXTRACT_DATE
	DATE_OF_BIRTH,
	PATIENT_GENDER_CODE,
	LOGICAL_DELETE_INDICATOR
FROM
	SILVER_DF1.FORIAN.PHARMACY_TRANSACTION a
WHERE YEAR BETWEEN '2021' AND '2022'
AND EXTRACT_DATE between '2022-03-05' AND '2022-06-10'
; 



/*


copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_CLAIM_DIAGNOSIS/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_DIAGNOSIS_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_CLAIM_HEADER/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_HEADER_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PATIENT/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PATIENT_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PAYER/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PAYER_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PROCEDURE/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PROCEDURE_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PROVIDER/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_CLAIM_PROVIDER_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CONNECTION/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CONNECTION_20220627 
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;


copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_COB/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_COB_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CLAIM_ADJUSTMENT/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CLAIM_ADJUSTMENT_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;




copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CLAIM_PAYMENT/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_CLAIM_PAYMENT_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;



copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_SERVICE_ADJUSTMENT/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_SERVICE_ADJUSTMENT_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;


copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_SERVICE_PAYMENT/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_MEDICAL_HOSPITAL_REMITTANCE_SERVICE_PAYMENT_20220627 
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;


copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_PHARMACY_TRANSACTION/' 
from SCRATCHPAD.PUBLIC.ANLITIKS_PHARMACY_TRANSACTION_20220627
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;


--CONSUMER
copy into 's3://forian-client-anlitiks/complete_data/extract_date=2022-06-30/ANLITIKS_SDoH_CONSUMER/' 
from  SCRATCHPAD.PUBLIC.ANLITIKS_SDoH_CONSUMER
   credentials = (AWS_KEY_ID = 'ASIAVNCO3BX4C4DDIX5A'
AWS_SECRET_KEY = 'O/ohJRtngwGcDavlW4oeeH3y6v/pxigXEZozAdmx'
AWS_TOKEN = 'IQoJb3JpZ2luX2VjENj//////////wEaCXVzLWVhc3QtMSJHMEUCIGY5+OTrVtJPcQoGnZbOc6aMKQKKg9zyxE0O4mMn4BjhAiEAorlaN16kMx8O3bAOSgwmChe7T/ws9XGUsRf+Q0Oie+8qoQMI8f//////////ARABGgwzNzE2ODAwMjIwMDgiDKiPjwP9RuPmnIO2aSr1AnnmuRaMBONfWy+BrvWWjTbSHDRekhwKDWJZHnunElauxju0rBvUeg4W2+sTcHwp8poSXKR/N8XFbAGQhzywrHSFu9vd0tyROJWT2jO2dylGgQlOM9miSflZbUpLZcmmInS4ny0/JNjEf6FuGkSxYvWYyJiRsQF5SbfyQ2FNDsqESTKa4vVZOEACZe6zdjyquUmKN9Y2mPhKXaA1rQ/G2P1yXyXPovYApvY5s2kBVOYv2I2nxafR4tj5LagVbLvBsbYf+rJ2R7tczy93RJOh7dlmBqmXBt4fmKkJfqpzni/YiWTcSoqTvo7ViRZiO6HRLqqUduN/bP5U98SiHfbqaL3px/zjqHGaLzTgSo3vgSf/maeBADEtvAkN9rZGjvHMi4icZNapYpJzSpMPacUtRROjfYHjcPSq4QxZvArSCZiQSTflvXqPGovC2G1E9i2w9V36ywC8R1QLV39TBsEDH/dRq/hpKj/4jddJKuzBqcoufYQLyU0w7cfslQY6pgHOfNbr10JJOCfF0YK9ZIv/Dp7BBTYULUxCh7o4d3JZfzzIFVx3NYIT2wQry83HWzl7oI+/vvC0ObPCinzKhZ27CPmtP9mzK5xWYRP3Jr30I+IzTlWYMQM3lVpf0vqn5+UTB36YrToUInzvoXtAuFWbdFAHAcAGIKotvsRZik0xkYsNk/wLaUkhKae7HFbLWC+Otre9BHyYx6W/FRoufI5e1n4WwgLu')
file_format = (format_name = SCRATCHPAD.PUBLIC.MY_PARQUET_UNLOAD_FORMAT)
HEADER = TRUE;


*/

CREATE OR REPLACE TABLE SCRATCHPAD.PUBLIC.ANLITIKS_SDoH_CONSUMER AS
SELECT
TOKEN_1, TOKEN_2,
AGE_IN_TWO_YEAR_INCREMENTS_PERSON,
BIRTH_YEAR,
DATE_OF_BIRTH_PERSON_YYYY,
--date_of_birth_input_individual_yyyy,
household_size,
--age_in_two_year_increments_1st_person_in_household_precision_level_code,
--age_in_two_year_increments_1st_person_in_household_precision_level_description,
death_month,
death_year,
deceased_indicator,
education_person_code,
education_person_description,
baby_care,
household_size_100,
new_parent_code,
new_parent_description,
number_of_children,
number_of_children_100,
presence_of_children,
presence_of_children_100,
presence_of_children_100_precision_level_code,
presence_of_children_precision_level_description,
gender_person,
exercise_health_grouping,
marital_status_in_the_household_code,
marital_status_in_the_household_100_code,
marital_status_in_the_household_100_description,
marital_status_in_the_household_description,
occupation_person_code,
occupation_person_description,
--occupation_detail_person_code,
--occupation_detail_person_description,
political_party_person_code,
political_party_person_description,
dwelling_type_code,
dwelling_type_description,
home_owner_renter_code,
home_owner_renter_100_code,
home_owner_renter_description,
home_owner_type_detail_real_property_data_only_code,
home_owner_type_detail_real_property_data_only_description,
race_code_person_code,
race_code_person_description,
race_code_low_detail_code,
race_code_low_detail_description,
income_estimated_household_broad_ranges_code,
income_estimated_household_broad_ranges_100_code,
income_estimated_household_broad_ranges_100_description,
income_estimated_household_broad_ranges_description,
income_estimated_household_higher_ranges_code,
income_estimated_household_higher_ranges_description,
income_estimated_household_narrow_ranges_code,
income_estimated_household_narrow_ranges_description,
net_worth_gold_code,
net_worth_gold_description,
economic_stability_indicator_score,
economic_stability_indicator_financial_score,
income_estimated_household_broad_ranges_100_precision_level_code,
income_estimated_household_broad_ranges_precision_level_description,
upscale_living,
home_owner_renter_100_description,
home_owner_renter_100_precision_level_code,
home_owner_renter_precision_level_description,
household_size_100_precision_level_code,
household_size_precision_level_description,
inferred_household_rank
FROM REFERENCE.CONSUMER.CONSUMER_OCT2021
;
