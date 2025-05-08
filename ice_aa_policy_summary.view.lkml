# Creating this view for the temporary use in the inforce dashboard built as part of MIDAS. In the longer term we won't need to report
# on Tiara but in the meantime I have set up this report.


view: ice_aa_policy_summary {
  derived_table: {
    sql:select * from (select *, row_number() over(partition by policy_reference_number, quote_id, transaction_period_start_date
        , policy_transaction_type, transaction_period_end_date, scheme) as dup
        from dbuser.ice_aa_policy_summary) a
        where policy_transaction_type IN ('NEW_BUSINESS','RENEWAL_ACCEPT','CANCELLATION') and dup = 1
          ;;
  }

  dimension: Scheme {
    type: string
    sql:CASE WHEN substr (policy_reference_number,6,1) = 1 THEN '103'
        WHEN substr (policy_reference_number,6,1) = 2 THEN '173'
        WHEN policy_reference_number = 999 THEN ''
        ELSE '102'
        END;;
  }

  measure: table_last_refreshed_date {
    type: date_time
    sql: max(loaddttm) ;;
  }

  measure: inforce_yesterday {
    type: number
    sql:
    SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -1 AND to_date (transaction_period_end_date) >= to_date (sysdate) -1 AND policy_transaction_type IN ('NEW_BUSINESS','RENEWAL_ACCEPT') THEN 1 WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -1 AND to_date (transaction_period_end_date) >= to_date (sysdate) -1 AND policy_transaction_type = 'CANCELLATION' THEN -1 ELSE 0 END) ;;
    value_format: "#,##0"
  }

  measure: inforce_8_days_ago {
    type: number
    sql:
    SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -8 AND to_date (transaction_period_end_date) >= to_date (sysdate) -8 AND policy_transaction_type IN ('NEW_BUSINESS','RENEWAL_ACCEPT') THEN 1 WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -8 AND to_date (transaction_period_end_date) >= to_date (sysdate) -8 AND policy_transaction_type = 'CANCELLATION' THEN -1 ELSE 0 END);;
    value_format: "#,##0"
  }

  measure: inforce_15_days_ago {
    type: number
    sql: SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -15 AND to_date (transaction_period_end_date) >= to_date (sysdate) -15 AND policy_transaction_type IN ('NEW_BUSINESS','RENEWAL_ACCEPT') THEN 1 WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -15 AND to_date (transaction_period_end_date) >= to_date (sysdate) -15 AND policy_transaction_type = 'CANCELLATION' THEN -1 ELSE 0 END) ;;
    value_format: "#,##0"
  }

  measure: inforce_30_days_ago {
    type: number
    sql: SUM(CASE WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -30 AND to_date (transaction_period_end_date) >= to_date (sysdate) -30 AND policy_transaction_type IN ('NEW_BUSINESS','RENEWAL_ACCEPT') THEN 1 WHEN to_date (transaction_period_start_date) <= to_date (sysdate) -30 AND to_date (transaction_period_end_date) >= to_date (sysdate) -30 AND policy_transaction_type = 'CANCELLATION' THEN -1 ELSE 0 END) ;;
    value_format: "#,##0"
  }
  ## # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: ice_aa_policy_summary {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
