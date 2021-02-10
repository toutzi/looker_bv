view: dv_commandes {
  derived_table: {
    explore_source: dig_commandes {
      column: code_commande {}
      column: code_magasin {}
      column: sum_total_ht {}
    }
  }

  dimension: code_commande {
    type: number
    primary_key: yes
  }

  dimension: code_magasin {
    type: string
  }

  dimension: sum_total_ht {
    value_format_name: eur
    type: number
  }
}
