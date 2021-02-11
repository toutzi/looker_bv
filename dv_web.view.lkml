view: dv_web {
  derived_table: {
    sql: select
        m.id_magasin,
        m.cd_magasin as code,
        m.cd_pays,
        m.nom as magasin,
        m.surf_vte as surface,
        m.typ_mag as type,
        min(m.date_ouv) as date_ouv,
        sum(d.total_ht) as total_ht
      from `bureauvallee.ods.magasin` as m
      left join `bureauvallee.ods.dig_commandes` as d
      on m.cd_magasin = d.code_magasin
      group by 1,2,3,4,5,6
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.id_magasin ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: cd_pays {
    type: string
    sql: ${TABLE}.cd_pays ;;
  }

  dimension: magasin {
    type: string
    sql: ${TABLE}.magasin ;;
  }

  dimension: surface {
    type: number
    sql: ${TABLE}.surface ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: date_ouv {
    type: time
    datatype: datetime
    sql: ${TABLE}.date_ouv ;;
  }

  dimension: total_ht {
    type: number
    sql: ${TABLE}.total_ht ;;
  }

  set: detail {
    fields: [
      id_magasin,
      code,
      cd_pays,
      magasin,
      surface,
      type,
      date_ouv_time,
      total_ht
    ]
  }
}
