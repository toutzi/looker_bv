view: dv_web {
  derived_table: {
    sql: select
        code_magasin,
        sum(total_ht) as total_ht
      from  `bureauvallee.ods.dig_commandes`
      group by 1
       ;;
  }

  measure: count {
    type: count
  }

  dimension: code_magasin {
    primary_key: yes
    type: string
    sql: ${TABLE}.code_magasin ;;
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
