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

  dimension: dept {
    type: string
    sql: ${TABLE}.dept ;;
  }

  dimension: nb_ventes_mag {
    type: number
    sql: ${TABLE}.nb_ventes_mag ;;
  }

  dimension: nb_ventes_web {
    type: number
    sql: ${TABLE}.nb_ventes_web ;;
  }

  dimension: nom {
    type: string
    sql: ${TABLE}.nom ;;
  }

  dimension: pct {
    type: number
    sql: ${TABLE}.pct ;;
  }

  dimension: surf_vte {
    type: number
    sql: ${TABLE}.SURF_VTE ;;
  }

  dimension: total_mag {
    type: number
    sql: ${TABLE}.total_mag ;;
  }

  dimension: total_web {
    type: number
    sql: ${TABLE}.total_web ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
