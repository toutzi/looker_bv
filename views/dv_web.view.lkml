view: dv_web {
  derived_table: {
    sql: select
        m.id_magasin,
        m.nom,
        d.code_magasin,
        d.date_de_commande,
        sum(d.total_ht) as total_ht
        from  ods.magasin m
        left join ods.dig_commandes d
        on  m.cd_magasin = d.code_magasin
        group by 1,2,3,4
 ;;
  }

  measure: count {
    type: count
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.id_magasin ;;
  }

  dimension: magasin {
    type: number
    sql: ${TABLE}.nom ;;
  }

  dimension: code_magasin {
    #primary_key: yes
    type: string
    sql: ${TABLE}.code_magasin ;;
  }
  dimension_group: date_de_commande {
    type: time
    timeframes: [date, week, week_of_year ,month, month_name , year, raw, fiscal_month_num, fiscal_quarter, fiscal_quarter_of_year, fiscal_year]
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
