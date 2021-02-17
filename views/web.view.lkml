view: web {
  derived_table: {
    sql: select
        Code_magasin,
        total_HT
      from ods.dig_commandes
      group by 1,2
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: code_magasin {
    primary_key: yes
    type: string
    sql: ${TABLE}.Code_magasin ;;
  }

  dimension: total_ht {
    type: number
    sql: ${TABLE}.total_ht ;;
  }

  set: detail {
    fields: [code_magasin, total_ht]
  }
}
