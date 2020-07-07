view: lk_h_policy_history_scored {
  derived_table: {
    sql: SELECT
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_yesterday_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_8_days_ago_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND AAUICL_IND_BDS = 1  THEN 1 ELSE 0 END) AS inforce_15_days_ago_bds,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_yesterday_cts,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_8_days_ago_cts,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND  AAUICL_IND_CTS = 1 THEN 1 ELSE 0 END) AS inforce_15_days_ago_cts,

SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_yesterday_policy,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_8_days_ago_policy,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_15_days_ago_policy,

SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND broker_ind_bds = 1  THEN 1 ELSE 0 END) AS inforce_yesterday_bds_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND broker_ind_bds = 1  THEN 1 ELSE 0 END) AS inforce_8_days_ago_bds_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND broker_ind_bds = 1  THEN 1 ELSE 0 END) AS inforce_15_days_ago_bds_broker,

SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND  broker_ind_cts = 1 THEN 1 ELSE 0 END) AS inforce_yesterday_cts_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND  broker_ind_cts = 1 THEN 1 ELSE 0 END) AS inforce_8_days_ago_cts_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) > (sysdate) -15 AND CFI_IND = 0 AND  broker_ind_cts = 1 THEN 1 ELSE 0 END) AS inforce_15_days_ago_cts_broker,


SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND (broker_ind_bds = 1 OR broker_ind_cts = 1) THEN 1 ELSE 0 END) AS inforce_yesterday_policy_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND (broker_ind_bds = 1 OR broker_ind_cts = 1) THEN 1 ELSE 0 END) AS inforce_8_days_ago_policy_broker,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND  (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND (broker_ind_bds = 1 OR broker_ind_cts = 1) THEN 1 ELSE 0 END) AS inforce_15_days_ago_policy_broker,



SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2016-08-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2017-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_home_bds_fy17,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2017-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2018-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_home_bds_fy18,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2018-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2019-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_home_bds_fy19,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2019-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2020-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_bds = 1) then 1 else 0 end) as broker_count_home_bds_fy20,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2020-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_bds = 1 then 1 else 0 end) as broker_count_home_bds_fy21_to_date,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND timestamp(add_months( to_date(sysdate), -12 )) <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_bds = 1 then 1 else 0 end) as broker_count_home_bds_latest_12_months,


SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2016-08-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2017-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_home_cts_fy17,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2017-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2018-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_home_cts_fy18,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2018-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2019-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_home_cts_fy19,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2019-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < '2020-02-01' AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND (broker_ind_cts = 1) then 1 else 0 end) as broker_count_home_cts_fy20,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND '2020-02-01' <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_cts = 1 then 1 else 0 end) as broker_count_home_cts_fy21_to_date,
SUM(CASE WHEN schedule_cover_start_dttm = annual_cover_start_dttm  AND timestamp(add_months( to_date(sysdate), -12 )) <= annual_cover_start_dttm  AND annual_cover_start_dttm < TIMESTAMP(to_date(sysdate)) AND schedule_cover_start_dttm < schedule_cover_end_dttm AND cfi_ind = 0 AND broker_ind_cts = 1 then 1 else 0 end) as broker_count_home_cts_latest_12_months






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

  dimension: inforce_yesterday_policy {
    type: number
    sql: ${TABLE}.inforce_yesterday_policy ;;
  }

  dimension: inforce_8_days_ago_policy {
    type: number
    sql: ${TABLE}.inforce_8_days_ago_policy ;;
  }

  dimension: inforce_15_days_ago_policy {
    type: number
    sql: ${TABLE}.inforce_15_days_ago_policy ;;
  }

  dimension: inforce_yesterday_bds_broker {
    type: number
    sql: ${TABLE}.inforce_yesterday_bds_broker ;;
  }

  dimension: inforce_8_days_ago_bds_broker {
    type: number
    sql: ${TABLE}.inforce_8_days_ago_bds_broker ;;
  }

  dimension: inforce_15_days_ago_bds_broker {
    type: number
    sql: ${TABLE}.inforce_15_days_ago_bds_broker ;;
  }

  dimension: inforce_yesterday_cts_broker {
    type: number
    sql: ${TABLE}.inforce_yesterday_cts_broker ;;
  }

  dimension: inforce_8_days_ago_cts_broker {
    type: number
    sql: ${TABLE}.inforce_8_days_ago_cts_broker ;;
  }

  dimension: inforce_15_days_ago_cts_broker {
    type: number
    sql: ${TABLE}.inforce_15_days_ago_cts_broker ;;
  }

  dimension: broker_count_home_bds_fy17 {
    type: number
    sql: ${TABLE}.broker_count_home_bds_fy17 ;;
  }

  dimension: broker_count_home_bds_fy18 {
    type: number
    sql: ${TABLE}.broker_count_home_bds_fy18 ;;
  }

  dimension: broker_count_home_bds_fy19 {
    type: number
    sql: ${TABLE}.broker_count_home_bds_fy19 ;;
  }

  dimension: broker_count_home_bds_fy20 {
    type: number
    sql: ${TABLE}.broker_count_home_bds_fy20 ;;
  }

  dimension: broker_count_home_bds_fy21_to_date {
    type: number
    sql: ${TABLE}.broker_count_home_bds_fy21_to_date ;;
  }

  dimension: broker_count_home_bds_latest_12_months {
    type: number
    sql: ${TABLE}.broker_count_home_bds_latest_12_months ;;
  }


  dimension: broker_count_home_cts_fy17 {
    type: number
    sql: ${TABLE}.broker_count_home_cts_fy17 ;;
  }

  dimension: broker_count_home_cts_fy18 {
    type: number
    sql: ${TABLE}.broker_count_home_cts_fy18 ;;
  }

  dimension: broker_count_home_cts_fy19 {
    type: number
    sql: ${TABLE}.broker_count_home_cts_fy19 ;;
  }

  dimension: broker_count_home_cts_fy20 {
    type: number
    sql: ${TABLE}.broker_count_home_cts_fy20 ;;
  }

  dimension: broker_count_home_cts_fy21_to_date {
    type: number
    sql: ${TABLE}.broker_count_home_cts_fy21_to_date ;;
  }

  dimension: broker_count_home_cts_latest_12_months {
    type: number
    sql: ${TABLE}.broker_count_home_cts_latest_12_months ;;
  }


  dimension: inforce_yesterday_policy_broker {
    type: number
    sql: ${TABLE}.inforce_yesterday_policy_broker ;;
  }

  dimension: inforce_8_days_ago_policy_broker {
    type: number
    sql: ${TABLE}.inforce_8_days_ago_policy_broker ;;
  }

  dimension: inforce_15_days_ago_policy_broker {
    type: number
    sql: ${TABLE}.inforce_15_days_ago_policy_broker ;;
  }


}
