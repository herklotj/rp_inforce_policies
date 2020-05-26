view: lk_h_policy_history_scored {
  derived_table: {
    sql: SELECT
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_yesterday_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_8_days_ago_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_15_days_ago_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_yesterday_cts,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_8_days_ago_cts,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_15_days_ago_cts
FROM lk_h_policy_history_scored

     ;;
  }

  dimension: inforce_yesterday_buildings {
    type: number
    sql: ${TABLE}.inforce_yesterday_bds ;;
  }

  dimension: inforce_8_days_ago_buildings {
    type: number
    sql: ${TABLE}.inforce_8_days_ago_bds ;;
  }

  dimension: inforce_15_days_ago_buildings {
    type: number
    sql: ${TABLE}.inforce_15_days_ago_bds ;;
  }

  dimension: inforce_yesterday_contents {
    type: number
    sql: ${TABLE}.inforce_yesterday_cts ;;
  }

  dimension: inforce_8_days_ago_contents {
    type: number
    sql: ${TABLE}.inforce_8_days_ago_cts ;;
  }

  dimension: inforce_15_days_ago_contents {
    type: number
    sql: ${TABLE}.inforce_15_days_ago_cts ;;
  }


}
