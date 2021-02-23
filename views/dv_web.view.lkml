view: dv_web {
  derived_table: {
    sql: select
        code_magasin,
        min(DATE(date_de_commande)) as date_de_commande,
        sum(total_ht) as total_ht
        from  ods.dig_commandes
        group by 1
 ;;
  }

  measure: count {
    type: count
  }

  #dimension: id_magasin {
  #  type: number
  #  sql: ${TABLE}.id_magasin ;;
  #}

  #dimension: magasin {
  #  type: number
  #  sql: ${TABLE}.nom ;;
  #}

  dimension: code_magasin {
    primary_key: yes
    type: string
    sql: ${TABLE}.code_magasin ;;
  }

  dimension_group: date_de_commande {
    type: time
    timeframes: [date, week, week_of_year ,month, month_name , year, raw, fiscal_month_num, fiscal_quarter, fiscal_quarter_of_year, fiscal_year]
    datatype: date
    sql: ${TABLE}.date_de_commande ;;
  }

  dimension: total_ht {
    type: number
    sql: ${TABLE}.total_ht ;;
  }
}
