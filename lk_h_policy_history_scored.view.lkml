view: lk_h_policy_history_scored {
  derived_table: {
    sql: SELECT
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_yesterday_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -7 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -7 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_7_days_ago_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -14 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -14 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_14_days_ago_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_yesterday_cts,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -7 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -7 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_7_days_ago_cts,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -14 AND  (SCHEDULE_COVER_END_DTTM) > to_date (sysdate) -14 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_14_days_ago_cts
FROM lk_h_policy_history_scored

     ;;
  }

  dimension: inforce_yesterday_buildings {
    type: number
    sql: ${TABLE}.inforce_yesterday_bds ;;
  }

  dimension: inforce_7_days_ago_buildings {
    type: number
    sql: ${TABLE}.inforce_7_days_ago_bds ;;
  }

  dimension: inforce_14_days_ago_buildings {
    type: number
    sql: ${TABLE}.inforce_14_days_ago_bds ;;
  }

  dimension: inforce_yesterday_contents {
    type: number
    sql: ${TABLE}.inforce_yesterday_cts ;;
  }

  dimension: inforce_7_days_ago_contents {
    type: number
    sql: ${TABLE}.inforce_7_days_ago_cts ;;
  }

  dimension: inforce_14_days_ago_contents {
    type: number
    sql: ${TABLE}.inforce_14_days_ago_cts ;;
  }

}
