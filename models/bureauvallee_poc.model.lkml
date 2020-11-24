connection: "bigquery_demo"

# include all the views
include: "/views/**/*.view"

datagroup: bureauvallee_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: bureauvallee_poc_default_datagroup

explore: deriv_table {}

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


explore: tf_vente {

  join: article {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tf_vente.id_article}=${article.id_article} ;;
  }

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

  join: article_arbo {
    type: left_outer
    relationship: one_to_many
    sql_on: ${article.id_article}=${article_arbo.id_article} ;;
  }

  join: arbo {
    type: left_outer
    relationship: many_to_one
    sql_on: ${article_arbo.id_arbo}=${arbo.id_arbo} ;;
  }

  join: n4 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${article_arbo.id_n4_n4}=${n4.id_n4_n4};;
  }

  join: n3_ss_famille {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n4.id_n3_ssfamille}=${n3_ss_famille.id_n3_ssfamille};;
  }

  join: n2_famille {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n3_ss_famille.id_n2_famille}=${n2_famille.id_n2_famille};;
  }

  join: n1_division {
    type: left_outer
    relationship: many_to_one
    sql_on: ${n2_famille.id_n1_division}=${n1_division.id_n1_division};;
  }

  join: magasin {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tf_vente.id_magasin}=${magasin.id_magasin} ;;
  }

 join: dig_commandes {
    type: inner
    relationship: one_to_many
    sql_on: ${magasin.cd_magasin} = ${dig_commandes.code_magasin} ;;
  }

  join: dig_nos_magasins {
    type: inner
    relationship: many_to_one
    sql_on: ${dig_commandes.code_magasin} = ${dig_nos_magasins.code_magasin};;
  }

#  join: dig_clients {
#    type: inner
#    relationship: many_to_one
#    sql_on: ${dig_commandes.code_client} = CAST(${dig_clients.code_client} as String) ;;
#  }

# join: dig_clients_connexions {
#    type: inner
#    relationship: one_to_one
#    sql_on: ${dig_clients.code_client}=${dig_clients_connexions.code_client} ;;
#  }

#  join: dig_produits_commandes {
#    type: inner
#    relationship: one_to_many
#    sql_on: ${dig_commandes.code_commande} = ${dig_produits_commandes.code_commande};;
#  }

}

explore: dig_commandes {

  join: dig_clients {
    type: inner
    relationship: one_to_many
    sql_on: ${dig_commandes.code_client} = cast(${dig_clients.code_client} as string);;
  }

  join: dig_nos_magasins {
    type: inner
    relationship: one_to_many
    sql_on: ${dig_commandes.code_magasin} = ${dig_nos_magasins.code_magasin};;
  }

 join: dig_produits_commandes {
    type: inner
    relationship: one_to_many
    sql_on: ${dig_commandes.code_commande} = ${dig_produits_commandes.code_commande};;
  }

  join: tf_vente {
    type: inner
    relationship: many_to_one
    sql_on: ${tf_vente.id_magasin}=${magasin.id_magasin} ;;
  }

  join: magasin {
    type: inner
    relationship: many_to_one
    sql_on: ${dig_commandes.code_magasin} = ${magasin.cd_magasin}  ;;
  }

}
