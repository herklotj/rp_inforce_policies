connection: "echo_aapricing"

# include all the views
include: "*.view"

datagroup: inforce_policies_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: inforce_policies_default_datagroup

explore: v_inforce_policies {}

explore: v_ice_inforce_policies {}

explore: lk_h_policy_history_scored {}
