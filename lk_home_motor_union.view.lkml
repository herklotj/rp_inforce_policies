view: lk_home_motor_union {
  derived_table: {
    sql:




SELECT sum(broker_count_fy17) as broker_count_fy17,
sum(broker_count_fy18) as broker_count_fy18,
sum(broker_count_fy19) as broker_count_fy19,
sum(broker_count_fy20) as broker_count_fy20,
sum(broker_count_fy21_to_date) as broker_count_fy21_to_date,
sum(broker_count_latest_12_months) as broker_count_latest_12_months


FROM


(


SELECT
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2016-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2017-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_fy17,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2017-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2018-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_fy18,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2018-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2019-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_fy19,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2019-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2020-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_fy20,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2020-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_fy21_to_date,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND timestamp(add_months( to_date(sysdate), -12 )) <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind = 1 then 1 else 0 end) as broker_count_latest_12_months
FROM lk_m_policy_history     ------motor


UNION ALL


SELECT
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2016-08-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2017-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_fy17,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2017-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2018-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_fy18,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2018-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2019-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_fy19,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2019-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2020-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_fy20,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2020-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_bds = 1 then 1 else 0 end) as broker_count_fy21_to_date,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND timestamp(add_months( to_date(sysdate), -12 )) <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_bds = 1 then 1 else 0 end) as broker_count_latest_12_months
FROM lk_h_policy_history_scored      --------- buildings


UNION ALL


SELECT
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2016-08-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2017-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_fy17,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2017-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2018-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_fy18,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2018-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2019-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_fy19,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2019-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2020-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_fy20,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2020-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_cts = 1 then 1 else 0 end) as broker_count_home_cts_fy21_to_date,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND timestamp(add_months( to_date(sysdate), -12 )) <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_cts = 1 then 1 else 0 end) as broker_count_home_cts_latest_12_months
FROM lk_h_policy_history_scored

) a

     ;;
  }

  dimension: broker_count_fy17 {
    type: number
    sql: ${TABLE}.broker_count_fy17 ;;
  }

  dimension: broker_count_fy18 {
    type: number
    sql: ${TABLE}.broker_count_fy18 ;;
  }

  dimension: broker_count_fy19 {
    type: number
    sql: ${TABLE}.broker_count_fy19 ;;
  }

  dimension: broker_count_fy20 {
    type: number
    sql: ${TABLE}.broker_count_fy20 ;;
  }

  dimension: broker_count_home_cts_fy21_to_date {
    type: number
    sql: ${TABLE}.broker_count_home_cts_fy21_to_date ;;
  }

  dimension: broker_count_home_cts_latest_12_months {
    type: number
    sql: ${TABLE}.broker_count_home_cts_latest_12_months ;;
  }




}
