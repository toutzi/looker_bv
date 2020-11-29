view: omnicanal {
  sql_table_name: `bureauvallee.ods.omnicanal`
    ;;

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.cd_magasin ;;
  }

  dimension: cp {
    type: string
    sql: ${TABLE}.CP ;;
  }

  dimension_group: dt_vente {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql: ${TABLE}.dt_vente ;;
  }

  dimension: dept {
    type: string
    sql: ${TABLE}.dept ;;
  }

  measure: nb_ventes_mag {
    type: sum
    sql: ${TABLE}.nb_ventes_mag ;;
  }

  measure: nb_ventes_web {
    type: sum
    sql: ${TABLE}.nb_ventes_web ;;
  }

  dimension: nom {
    type: string
    sql: ${TABLE}.nom ;;
  }

  dimension: surf_vte {
    type: number
    sql: ${TABLE}.SURF_VTE ;;
  }

  measure: total_mag {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.total_mag ;;
  }

  measure: total_web {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.total_web ;;
  }

  measure: pct {
    type: sum
    value_format_name: percent_1
    sql: ${TABLE}.pct ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
