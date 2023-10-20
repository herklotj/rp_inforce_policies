view: v_ice_inforce_policies_withrows {
  derived_table: {
    sql:select * from (
    select *,row_number() over (order by scheme) as row_no from v_ice_inforce_policies) a
    ;;
  }

  dimension: row_no {
    type: number
    sql: ${TABLE}.row_no;;

  }

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
