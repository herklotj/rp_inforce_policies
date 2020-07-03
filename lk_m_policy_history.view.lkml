view: lk_m_policy_history {
  derived_table: {
    sql: SELECT
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND broker_ind = 1  THEN 1 ELSE 0 END) AS inforce_yesterday_motor_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND broker_ind = 1  THEN 1 ELSE 0 END) AS inforce_8_days_ago_motor_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND broker_ind = 1  THEN 1 ELSE 0 END) AS inforce_15_days_ago_motor_broker
FROM lk_m_policy_history

           ;;
  }

  dimension: inforce_yesterday_motor_broker {
    type: number
    sql: ${TABLE}.inforce_yesterday_motor_broker ;;
  }

  dimension: inforce_8_days_ago_motor_broker {
    type: number
    sql: ${TABLE}.inforce_8_days_ago_motor_broker ;;
  }

  dimension: inforce_15_days_ago_motor_broker {
    type: number
    sql: ${TABLE}.inforce_15_days_ago_motor_broker ;;
  }


}
