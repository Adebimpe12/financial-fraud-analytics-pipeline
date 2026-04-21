
  
    

    create or replace table `spatial-rig-493920-b5`.`fraud_dataset_marts`.`fct_fraud_summary`
      
    partition by event_date
    cluster by type

    
    OPTIONS()
    as (
      

SELECT
    event_date,
    step,
    type,
    total_transactions,
    total_amount,
    fraud_count,
    flagged_fraud_count,

    SAFE_DIVIDE(fraud_count, total_transactions) AS fraud_rate,

    avg_amount,
    max_amount,

    debit_anomalies,
    credit_anomalies,

    CASE 
        WHEN SAFE_DIVIDE(fraud_count, total_transactions) > 0.05 THEN 'HIGH RISK'
        WHEN SAFE_DIVIDE(fraud_count, total_transactions) > 0.01 THEN 'MEDIUM RISK'
        ELSE 'LOW RISK'
    END AS risk_level,

    CASE 
        WHEN total_amount > 200000 OR fraud_count > 0 THEN 1
        ELSE 0
    END AS alert_flag

FROM `spatial-rig-493920-b5`.`fraud_dataset_int`.`int_fraud_transactions`
    );
  