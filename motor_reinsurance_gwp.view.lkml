view: motor_reinsurance_gwp {
  derived_table: {
    sql:

    SELECT
CASE WHEN substr (polnum,6,1) = 1 THEN '103'
WHEN substr (polnum,6,1) = 2 THEN '173'
ELSE '102' END AS scheme,
SUM(CASE WHEN policy_reference_number IS NULL THEN act_gross_premium_net_commission_txd_amt_nb ELSE act_gross_premium_net_commission_txd_amt_nb + act_gross_premium_net_commission_txd_amt_mta end) as inforce_yesterday_gwp


FROM


(

SELECT policy_reference_number as polnum, insurerquoteref, sum(act_gross_premium_net_commission_txd_amt) as act_gross_premium_net_commission_txd_amt_nb
FROM ice_aa_policy_summary
WHERE policy_transaction_type IN ('NEW_BUSINESS','RENEWAL_ACCEPT','CANCELLATION')
GROUP BY policy_reference_number, insurerquoteref
HAVING SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -1 AND to_date (transaction_period_end_date) >= to_date (sysdate) -1 AND policy_transaction_type IN ('NEW_BUSINESS','RENEWAL_ACCEPT') THEN 1 WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -1 AND to_date (transaction_period_end_date) >= to_date (sysdate) -1 AND policy_transaction_type = 'CANCELLATION' THEN -1 ELSE 0 END) = 1

) a


LEFT JOIN


(

SELECT policy_reference_number, max(to_date(transaction_period_start_date)), max(insurerquoterefmta) as insurerquoterefmta, sum(act_gross_premium_net_commission_txd_amt) as act_gross_premium_net_commission_txd_amt_mta
FROM ice_aa_policy_summary
WHERE policy_transaction_type IN ('MID_TERM_ADJUSTMENT', 'MID_TERM_ADJUSTMENT_TEMPORARY')
GROUP BY policy_reference_number
HAVING SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -1 AND to_date (transaction_period_end_date) >= to_date (sysdate) -1 AND policy_transaction_type IN ('MID_TERM_ADJUSTMENT') THEN 1 ELSE 0 END) = 1

) b


ON a.polnum = b.policy_reference_number



GROUP BY
CASE WHEN substr (polnum,6,1) = 1 THEN '103'
WHEN substr (polnum,6,1) = 2 THEN '173'
ELSE '102' END


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
