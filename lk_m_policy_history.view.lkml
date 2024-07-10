view: lk_m_policy_history {
  derived_table: {
    sql: SELECT
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND broker_ind = 1  THEN 1 ELSE 0 END) AS inforce_yesterday_motor_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND broker_ind = 1  THEN 1 ELSE 0 END) AS inforce_8_days_ago_motor_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND broker_ind = 1  THEN 1 ELSE 0 END) AS inforce_15_days_ago_motor_broker,

SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2016-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2017-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy17,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2017-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2018-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy18,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2018-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2019-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy19,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2019-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2020-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy20,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2020-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2021-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy21,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2021-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2022-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy22,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2022-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2023-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy23,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2023-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2024-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy24,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2024-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_fy25_to_date,

SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND timestamp(add_months( to_date(sysdate), -12 )) <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_motor_latest_12_months
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

  dimension: broker_count_motor_Financial_Year_17 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy17 ;;
  }

  dimension: broker_count_motor_Financial_Year_18 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy18 ;;
  }

  dimension: broker_count_motor_Financial_Year_19 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy19 ;;
  }

  dimension: broker_count_motor_Financial_Year_20 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy20 ;;
  }

  dimension: broker_count_motor_Financial_Year_21 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy21 ;;
  }

  dimension: broker_count_motor_Financial_Year_22 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy22 ;;
  }

  dimension: broker_count_motor_Financial_Year_23 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy23 ;;
  }

  dimension: broker_count_motor_Financial_Year_24 {
    type: number
    sql: ${TABLE}.broker_count_motor_fy24 ;;
  }

  dimension: broker_count_motor_Financial_Year_25_to_date {
    type: number
    sql: ${TABLE}.broker_count_motor_fy25_to_date ;;
  }

  dimension: broker_count_motor_latest_12_months {
    type: number
    sql: ${TABLE}.broker_count_motor_latest_12_months ;;
  }





}
