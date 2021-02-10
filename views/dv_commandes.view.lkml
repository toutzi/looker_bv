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
    sql: ${TABLE}.Code_commande ;;
  }

  dimension: code_magasin {
    type: string
    sql: ${TABLE}.Code_magasin ;;
  }

  dimension: sum_total_ht {
    value_format_name: eur
    type: number
    sql: ${TABLE}.sum_total_ht ;;
  }
}
