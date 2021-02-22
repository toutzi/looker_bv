view: dv_web {
  derived_table: {
    sql: select
        m.id_magasin,
        d.cd_magasin,
        d.date_de_commande,
        sum(d.total_ht) as total_ht
        from  ods.dig_commandes d
        left join ods.magasin m
        on  d.code_magasin = m.cd_magasi
      group by 1,2,3
 ;;
  }

  measure: count {
    type: count
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.id_magasin ;;
  }

  dimension: cd_magasin {
    primary_key: yes
    type: string
    sql: ${TABLE}.cd_magasin ;;
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
}
