view: dv_web {
  derived_table: {
    sql: select
        code_magasin,
        date_de_commande,
        sum(total_ht) as total_ht
      from  `bureauvallee.ods.dig_commandes`
      group by 1,2
       ;;
  }

  measure: count {
    type: count
  }

  dimension: code_magasin {
    type: string
    sql: ${TABLE}.code_magasin ;;
  }

  dimension_group: date_de_commande {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_de_commande ;;
  }

  dimension: total_ht {
    type: number
    sql: ${TABLE}.total_ht ;;
  }

  measure: sum_total_ht {
    type: sum
    sql: ${total_ht} ;;
  }


}
