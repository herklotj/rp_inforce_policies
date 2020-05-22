view: union_motor_home {
  derived_table: {
    sql: SELECT *,
case when scheme = 'Joint' then inforce_yesterday else 0 end as joint_yesterday,
case when scheme = 'Joint' then inforce_7_days_ago else 0 end as joint_7_days_ago,
case when scheme = 'Joint' then inforce_14_days_ago else 0 end as joint_14_days_ago


FROM (


SELECT
cover_type as scheme,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -1 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -1 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1) THEN 1 ELSE 0 END) AS inforce_yesterday,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -7 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -7 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1)THEN 1 ELSE 0 END) AS inforce_7_days_ago,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -14 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -14 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1)THEN 1 ELSE 0 END) AS inforce_14_days_ago,
SUM(CASE WHEN  (SCHEDULE_COVER_START_DTTM) <  (sysdate) -30 AND (SCHEDULE_COVER_END_DTTM) >  (sysdate) -30 AND CFI_IND = 0 AND (AAUICL_IND_BDS = 1 OR AAUICL_IND_CTS = 1)THEN 1 ELSE 0 END) AS inforce_30_days_ago
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

  dimension: inforce_7_days_ago {
    type: number
    sql: ${TABLE}.inforce_7_days_ago ;;
  }

  dimension: inforce_14_days_ago {
    type: number
    sql: ${TABLE}.inforce_14_days_ago ;;
  }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

  dimension: joint_yesterday {
    type: number
    sql: ${TABLE}.joint_yesterday ;;
  }

  dimension: joint_7_days_ago {
    type: number
    sql: ${TABLE}.joint_7_days_ago ;;
  }

  dimension: joint_14_days_ago {
    type: number
    sql: ${TABLE}.joint_14_days_ago ;;
  }

}
