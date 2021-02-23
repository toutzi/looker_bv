view: dv_web {
  derived_table: {
    explore_source: dig_commandes {
      column: code_magasin {}
      column: total_ht {}
      column: date_de_commande_date {}
    }
  }
  dimension: code_magasin {
    primary_key: yes
  }
  dimension: total_ht {
    type: number
  }
  dimension: date_de_commande_date {
    type: date
  }
}
