view: union_motor_home {
  derived_table: {
    sql: SELECT *,
case when scheme = 'Joint' then inforce_yesterday else 0 end as joint_yesterday,
case when scheme = 'Joint' then inforce_8_days_ago else 0 end as joint_8_days_ago,
case when scheme = 'Joint' then inforce_15_days_ago else 0 end as joint_15_days_ago


FROM (


SELECT
cover_type as scheme,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_yesterday,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -8 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -8 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_8_days_ago,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -15 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -15 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_15_days_ago,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -30 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -30 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_30_days_ago
FROM lk_h_policy_history_scored
GROUP BY cover_type


UNION ALL


SELECT * FROM v_ice_inforce_policies ) a

           ;;
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

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

  dimension: joint_yesterday {
    type: number
    sql: ${TABLE}.joint_yesterday ;;
  }

  dimension: joint_8_days_ago {
    type: number
    sql: ${TABLE}.joint_8_days_ago ;;
  }

  dimension: joint_15_days_ago {
    type: number
    sql: ${TABLE}.joint_15_days_ago ;;
  }

}
