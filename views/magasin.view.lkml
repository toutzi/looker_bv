view: magasin {
  sql_table_name: `ods.magasin`
    ;;

  dimension: cd_kit {
    type: string
    sql: ${TABLE}.CD_KIT ;;
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.CD_MAGASIN ;;
  }

  measure: count_cd_magasin {
    label: "Nbre de magasins vendeurs"
    type: count_distinct
    sql: ${TABLE}.CD_MAGASIN ;;
  }

  dimension: cd_pays {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.CD_PAYS ;;
  }

  dimension: cd_stru_ext {
    type: string
    sql: ${TABLE}.CD_STRU_EXT ;;
  }

  dimension: cd_stru_pere {
    type: string
    sql: ${TABLE}.CD_STRU_PERE ;;
  }

  dimension: cp {
    type: zipcode
    sql: ${TABLE}.CP ;;
  }

  dimension_group: date_ferm {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_FERM ;;
  }

  dimension_group: date_ouv {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_OUV ;;
  }

  dimension: diff_date {
    type: number
    sql: DATE_DIFF(CURRENT_DATE(), ${date_ouv_date}, YEAR) ;;
  }

  dimension: P_comparable {
    type: string
    sql: (SELECT ${nom} FROM ods.magasin WHERE ${date_ouv_date} between "2019-01-01" AND "2019-12-31");;
  }

  dimension: P_non_comparable {
    type: string
    sql: ${nom};;
  }

  dimension: intervalle_anciennete {
    label: "Ancienneté"
    type: tier
    sql: ${diff_date};;
    tiers: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70]
    style: relational
  }

  dimension: id_magasin {
    type: number
    primary_key: yes
    sql: ${TABLE}.ID_MAGASIN ;;
  }

  dimension: nom {
    label: "Magasins"
    type: string
    sql: ${TABLE}.NOM ;;
  }

  dimension: nom_court {
    type: string
    sql: ${TABLE}.NOM_COURT ;;
  }

  dimension: progiciel {
    type: string
    sql: ${TABLE}.PROGICIEL ;;
  }

#  dimension: raison_soc {
#    type: string
#    sql: ${TABLE}.RAISON_SOC ;;
#  }

  dimension: surf_vte {
    type: number
    sql: ${TABLE}.SURF_VTE ;;
  }

  dimension: typ_mag {
    label: "Type"
    type: string
    sql: ${TABLE}.TYP_MAG ;;
  }

  dimension: ville {
    type: string
    sql: ${TABLE}.VILLE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
