view: tf_vente_update {
  sql_table_name: `bureauvallee.ods.tf_vente_update`
    ;;

  dimension: ca_ht {
    type: string
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
    type: string
    sql: ${TABLE}.marge_brute ;;
  }

  dimension: nb_clients {
    type: number
    sql: ${TABLE}.nb_clients ;;
  }

  dimension: nom {
    type: string
    sql: ${TABLE}.NOM ;;
  }

  dimension: qtite {
    type: string
    sql: ${TABLE}.qtite ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
