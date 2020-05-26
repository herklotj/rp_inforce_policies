view: v_ice_inforce_policies {
  sql_table_name: aapricing.v_ice_inforce_policies ;;

  dimension: inforce_yesterday {
    type: number
    sql: ${TABLE}.inforce_yesterday ;;
  }

  dimension: inforce_8_days_ago {
    type: number
    sql: ${TABLE}.inforce_8_days_ago ;;
  }

  dimension: inforce_15_days_ago {
    type: number
    sql: ${TABLE}.inforce_15_days_ago ;;
  }


  dimension: inforce_30_days_ago {
    type: number
    sql: ${TABLE}.inforce_30_days_ago ;;
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
