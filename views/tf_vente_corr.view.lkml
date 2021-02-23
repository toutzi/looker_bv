view: tf_vente_corr {
  sql_table_name: `bureauvallee.ods.tf_vente_corr`
    ;;

  dimension: ca_ht {
    type: number
    sql: ${TABLE}.ca_ht ;;
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.CD_MAGASIN ;;
  }

  dimension_group: dte_vente {
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
    sql: ${TABLE}.DTE_VENTE ;;
  }

  dimension: marge_brute {
    type: number
    sql: ${TABLE}.marge_brute ;;
  }

  dimension: nb_clients {
    type: string
    sql: ${TABLE}.nb_clients ;;
  }

  dimension: nom {
    type: string
    sql: ${TABLE}.NOM ;;
  }

  dimension: qtite {
    type: number
    sql: ${TABLE}.qtite ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
