view: v_ice_reserving_premium_vectors_for_overall {
  derived_table: {
    sql:select * from (
          select *, cast((row_number() over (order by uw_year, fuw_year, scheme, acc_month ASC)) as varchar) as row_no from v_ice_reserving_premium_vectors) a
          union all
          select generate_series(select count(*)+1 from v_ice_reserving_premium_vectors,select count(*)+1 from v_ice_reserving_premium_vectors+35+(select count(*)+1 from v_ice_reserving_premium_vectors - 519) ) as row_no, null as uw_year, null as fuw_year, null as scheme, null as acc_month,
          null as earned_premium, null as written_premium, null as exposure from generate_series(select count(*)+1 from v_ice_reserving_premium_vectors,select count(*)+1 from v_ice_reserving_premium_vectors+35+(select count(*)+1 from v_ice_reserving_premium_vectors - 519) )

          ;;
  }

  dimension: row_join_key {
    type: string
    sql: ${TABLE}.row_join_key;;

  }

  dimension: row_no {
    type: number
    sql: ${TABLE}.row_no;;

  }

  dimension: uw_year {
    type: string
    sql: ${TABLE}.uw_year ;;
  }

  dimension: fuw_year {
    type: string
    sql: ${TABLE}.fuw_year ;;
  }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

  dimension: acc_month {
    type: date
    sql: ${TABLE}.acc_month ;;
  }

  dimension: earned_premium {
    type: number
    sql: ${TABLE}.earned_premium ;;
  }


  dimension: written_premium {
    type: number
    sql: ${TABLE}.written_premium ;;
  }

  dimension: exposure {
    type: number
    sql: ${TABLE}.exposure ;;
  }

}
