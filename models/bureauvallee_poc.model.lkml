connection: "bigquery_demo"

# include all the views
include: "/views/**/*.view"

datagroup: bureauvallee_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: bureauvallee_poc_default_datagroup

explore: arbo {}

explore: article {
  join: fournisseur {
    type: left_outer
    relationship: many_to_one
    sql_on: ${article.id_fourn}=${fournisseur.id_fourn} ;;
  }

  join: marque {
    type: left_outer
    relationship: many_to_one
    sql_on: ${article.id_marque}=${marque.id_marque} ;;
  }
}

explore: article_arbo {

  join: arbo {
    type: left_outer
    relationship: many_to_one
    sql_on: ${article_arbo.id_arbo}=${arbo.id_arbo} ;;
  }

  join: article {
    type: left_outer
    relationship: many_to_one
    sql_on: ${article_arbo.id_article}=${article.id_article};;
  }

  join: n4 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${article_arbo.id_n4_n4}=${n4.id_n4_n4};;
  }
}

explore: fournisseur {}

explore: magasin {}

explore: marque {}

explore: n1_division {

  join: arbo {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n1_division.id_arbo}=${arbo.id_arbo};;
  }
}

explore: n2_famille {

  join: arbo {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n2_famille.id_arbo}=${arbo.id_arbo};;
  }

  join: n1_division {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n2_famille.id_n1_division}=${n1_division.id_n1_division};;
  }

}

explore: n3_ss_famille {

  join: arbo {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n3_ss_famille.id_arbo}=${arbo.id_arbo};;
  }

  join: n2_famille {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n3_ss_famille.id_n2_famille}=${n2_famille.id_n2_famille};;
  }

}

explore: n4 {

  join: arbo {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n4.id_arbo}=${arbo.id_arbo};;
  }

  join: n3_ss_famille {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n4.id_n3_ssfamille}=${n3_ss_famille.id_n3_ssfamille};;
  }

}

explore: tf_vente {

  join: article {
    type: full_outer
    relationship: many_to_many
    sql_on: ${tf_vente.id_article}=${article.id_article} ;;
  }

  join: magasin {
    type: full_outer
    relationship: many_to_many
    sql_on: ${tf_vente.id_magasin}=${magasin.id_magasin} ;;
  }

  join: dt_view {
    type: full_outer
    relationship: many_to_many
    sql_on: ${tf_vente.id_tf_vte}=£${dt_view.ID_TF_VTE} ;;
  }
}
