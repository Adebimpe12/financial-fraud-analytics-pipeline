

  create or replace view `spatial-rig-493920-b5`.`fraud_dataset_int`.`int_fraud_transactions`
  OPTIONS()
  as SELECT
    event_date,   
    step,
    type,

    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount,

    SUM(is_fraud) AS fraud_count,
    SUM(is_flagged_fraud) AS flagged_fraud_count,

    AVG(amount) AS avg_amount,
    MAX(amount) AS max_amount,

    SUM(debit_mismatch_flag) AS debit_anomalies,
    SUM(credit_mismatch_flag) AS credit_anomalies

FROM `spatial-rig-493920-b5`.`fraud_dataset_stg`.`stg_transactions`
GROUP BY event_date, step, type;

