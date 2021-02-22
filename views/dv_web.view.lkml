view: dv_web {
  derived_table: {
    sql: select
        m.id_magasin,
        m.cd_magasin,
        m.cd_pays,
        m.nom as magasins,
        m.surf_vte,
        m.date_ouv,
        m.typ_mag as Type,
        d.date_de_commande,
        sum(d.total_ht) as total_ht
        from ods.dig_commandes d
        left join ods.magasin m
        on d.code_magasin = m.CD_MAGASIN
      group by 1,2,3,4,5,6,7,8
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

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.cd_magasin ;;
  }

  dimension: cd_pays {
    type: string
    sql: ${TABLE}.cd_pays ;;
  }

  dimension: magasins {
    type: string
    sql: ${TABLE}.magasins ;;
  }

  dimension: surf_vte {
    type: number
    sql: ${TABLE}.surf_vte ;;
  }

  dimension_group: date_ouv {
    type: time
    datatype: datetime
    sql: ${TABLE}.date_ouv ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  dimension_group: date_de_commande {
    type: time
    timeframes: [date, week, week_of_year ,month, month_name , year, raw, fiscal_month_num, fiscal_quarter, fiscal_quarter_of_year, fiscal_year]
    sql: ${TABLE}.date_de_commande ;;
  }

  dimension: total_ht {
    type: number
    sql: ${TABLE}.total_ht ;;
  }

  set: detail {
    fields: [
      id_magasin,
      cd_magasin,
      cd_pays,
      magasins,
      surf_vte,
      date_ouv_time,
      type,
      total_ht
    ]
  }
}
