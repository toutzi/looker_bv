view: data_patch {
  sql_table_name: `bureauvallee.raw.data_patch`
    ;;

  dimension: ca_net {
    type: number
    sql: ${TABLE}.ca_net ;;
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.cd_magasin ;;
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_vente ;;
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
