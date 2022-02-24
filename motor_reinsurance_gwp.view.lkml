view: motor_reinsurance_gwp {
  derived_table: {
    sql:

   SELECT
polnum,
CASE WHEN substr (polnum,6,1) = 1 THEN '103'
WHEN substr (polnum,6,1) = 2 THEN '173'
ELSE '102' END AS scheme,
CASE WHEN d.birth_dt IS NULL then NULL ELSE int( Months_between(to_date(c.cover_start_dt), to_date(d.birth_dt)) / 12 ) end as ph_age,
ncb_years as ph_ncd,
vehicle_value_amount,
CASE WHEN policy_reference_number IS NULL THEN act_gross_premium_net_commission_txd_amt_nb ELSE act_gross_premium_net_commission_txd_amt_nb + act_gross_premium_net_commission_txd_amt_mta end as act_gross_premium_net_commission_txd_amt



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
HAVING SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -1 AND to_date (transaction_period_end_date) >= to_date (sysdate) -1 AND policy_transaction_type IN ('MID_TERM_ADJUSTMENT', 'MID_TERM_ADJUSTMENT_TEMPORARY') THEN 1 ELSE 0 END) >= 1

) b


ON a.polnum = b.policy_reference_number

LEFT JOIN qs_cover c ON (CASE WHEN policy_reference_number IS NULL THEN insurerquoteref ELSE insurerquoterefmta end) = c.quote_id
LEFT JOIN qs_drivers d ON (CASE WHEN policy_reference_number IS NULL THEN insurerquoteref ELSE insurerquoterefmta end) = d.quote_id AND d.driver_id = 0
LEFT JOIN qs_vehicles v ON (CASE WHEN policy_reference_number IS NULL THEN insurerquoteref ELSE insurerquoterefmta end) = v.quote_id and v.vehicle_id = 1



                 ;;
  }

  measure: inforce_yesterday_gwp {
    type: number
    sql: sum(act_gross_premium_net_commission_txd_amt) ;;
  }

  measure: total {
    type: number
    sql: count(*) ;;
  }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

  dimension: ph_age_flag {
    type: string
    sql: CASE WHEN ph_age >= 17 AND ph_age <= 20 then '17-20'
         WHEN ph_age >= 21 AND ph_age <= 24 then '21-24'
         ELSE 'Other' end  ;;
  }


  dimension: ncd_flag {
    type: string
    sql: CASE WHEN ph_ncd >= 0 AND ph_ncd <= 1 then '0-1'
         WHEN ph_ncd >= 9 then '9+'
         ELSE 'Other' end   ;;
  }


  dimension: vehicle_value_flag {
    type: string
    sql: CASE WHEN vehicle_value_amount > 50000 AND vehicle_value_amount <= 75000 then '50k - 75k'
         WHEN vehicle_value_amount > 75000 AND vehicle_value_amount <= 100000 then '75k - 100k'
         WHEN vehicle_value_amount > 100000 then '100k +' ELSE 'Other' end;;
  }

}
