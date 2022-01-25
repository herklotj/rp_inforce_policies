view: motor_reinsurance_gwp {
  derived_table: {
    sql: SELECT CASE
         WHEN substr (policy_reference_number,6,1) = 1 THEN '103'
         WHEN substr (policy_reference_number,6,1) = 2 THEN '173'
         ELSE '102'
       END AS scheme,
       SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -1 AND to_date (transaction_period_end_date) >= to_date (sysdate) -1  THEN act_gross_premium_net_commission_txd_amt ELSE 0 END) AS inforce_yesterday_gwp
FROM ice_aa_policy_summary
GROUP BY CASE
           WHEN substr (policy_reference_number,6,1) = 1 THEN '103'
           WHEN substr (policy_reference_number,6,1) = 2 THEN '173'
           ELSE '102'
         END

                 ;;
  }

  dimension: inforce_yesterday_gwp {
    type: number
    sql: round(${TABLE}.inforce_yesterday_gwp, 2) ;;
  }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

}
