view: table_patch_test_abe {
  sql_table_name: `bureauvallee.ods.Table_Patch_testABE`
    ;;

  dimension: ca_net {
    type: number
    sql: ${TABLE}.CA_NET ;;
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.CD_MAGASIN ;;
  }

  dimension_group: date_vente {
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
    sql: ${TABLE}.DATE_VENTE ;;
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.ID_MAGASIN ;;
  }

  dimension_group: processing {
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
    sql: ${TABLE}.PROCESSING_DATE ;;
  }

  dimension: qtite {
    type: number
    sql: ${TABLE}.QTITE ;;
  }

  dimension_group: send_patch {
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
    sql: ${TABLE}.SEND_PATCH_DATE ;;
  }

  dimension: statut {
    type: string
    sql: ${TABLE}.STATUT ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
