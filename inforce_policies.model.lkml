connection: "echo_aapricing"

# include all the views
include: "*.view"

datagroup: inforce_policies_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: inforce_policies_default_datagroup

explore: v_ice_inforce_policies {}

explore: lk_h_policy_history_scored {}

explore: union_motor_home {}

explore: lk_m_policy_history {}

explore: lk_home_motor_union {}

explore: motor_reinsurance_gwp {}
explore: v_ice_inforce_policies_withrows {}
explore: v_ice_reserving_premium_vectors {}
explore: v_ice_reserving_premium_vectors_for_overall {}
