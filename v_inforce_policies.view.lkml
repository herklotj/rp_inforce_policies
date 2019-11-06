view: v_inforce_policies {
  sql_table_name: aapricing.v_inforce_policies ;;

  dimension: inforce_30_days_ago {
    type: number
    sql: ${TABLE}.inforce_30_days_ago ;;
  }

  dimension: inforce_7_days_ago {
    type: number
    sql: ${TABLE}.inforce_7_days_ago ;;
  }

  dimension: inforce_yesterday {
    type: number
    sql: ${TABLE}.inforce_yesterday ;;
  }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
