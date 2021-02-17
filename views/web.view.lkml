view: web {
  derived_table: {
    sql: select
        Code_magasin,
        Date_de_commande,
        sum(total_HT) as total_ht
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

  dimension_group: date_de_commande {
    type: time
    timeframes: [date, week, week_of_year ,month, month_name , year, raw]
    datatype: date
    sql: ${TABLE}.date_de_commande ;;
  }

  dimension: total_ht {
    type: number
    sql: ${TABLE}.total_ht ;;
  }

  filter: date_filter {                 ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n"
    type: date
  }

  measure: sum_CA_drive_select_mois {
    type: sum
    value_format_name: eur
    label: "CA Drive"
    sql: CASE
          WHEN {% condition date_filter %} CAST(${date_de_commande_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${total_ht}
        END ;;
  }

  set: detail {
    fields: [code_magasin, total_ht]
  }
}