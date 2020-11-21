view: arbo {
  sql_table_name: `ods.arbo`
    ;;

  dimension: id_arbo {
    type: number
    primary_key: yes
    sql: ${TABLE}.ID_ARBO ;;
  }

  dimension: libelle {
    label: "lib_arbo"
    type: string
    sql: ${TABLE}.LIBELLE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
