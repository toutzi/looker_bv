connection: "bigquery_demo"

# include all the views
include: "/views/**/*.view"

datagroup: bureauvallee_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bureauvallee_poc_default_datagroup

explore: arbo {}

explore: article {}

explore: article_arbo {}

explore: fournisseur {}

explore: magasin {}

explore: marque {}

explore: n1_division {}

explore: n2_famille {}

explore: n3_ss_famille {}

explore: n4 {}

explore: tf_vente {}
