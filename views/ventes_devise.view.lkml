view: ventes_devise {
  sql_table_name: `bureauvallee.ods.ventes_devise`
    ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: devise {
    type: string
    sql: ${TABLE}.devise ;;
  }

  dimension: magasin {
    type: string
    sql: ${TABLE}.magasin ;;
  }

  dimension: marge {
    type: number
    sql: ${TABLE}.marge ;;
  }

  dimension: montant {
    type: number
    sql: ${TABLE}.montant ;;
  }

  dimension: quantite {
    type: number
    sql: ${TABLE}.quantite ;;
  }

  dimension: tickets {
    type: number
    sql: ${TABLE}.tickets ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

      ########################## Calcul global des KPIs ################################

  measure: sum_marge {
    type: sum
    value_format_name: eur
    sql: ${marge} ;;
  }

  measure: count_date {
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}date ;;
  }

  measure: sum_montant {
    value_format_name: eur
    type: sum
    sql: ${montant} ;;
  }

  measure: sum_nb_ticket {
    value_format_name: decimal_0
    type: sum
    sql: ${tickets} ;;
  }

  measure: sum_qtite {
    value_format_name: decimal_0
    type: sum
    sql: ${quantite};;
  }

  filter: date_filter {                 ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n"
    type: date
  }

  filter: date_filter_1 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-1"
    type: date
  }

  filter: date_filter_2 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-2"
    type: date
  }

  filter: date_filter_3 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-3"
    type: date
  }

}
