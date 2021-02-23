view: brute {
  sql_table_name: `bureauvallee.test2.Brute`
    ;;

  dimension: ca_ht {
    type: string
    sql: ${TABLE}.ca_ht ;;
  }

  dimension: ca_n {
    type: number
    sql: ${TABLE}.CA_N ;;
  }

  dimension: ca_n_1 {
    type: number
    sql: ${TABLE}.CA_N_1 ;;
  }

  dimension: ca_n_2 {
    type: number
    sql: ${TABLE}.CA_N_2 ;;
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.CD_MAGASIN ;;
  }

  dimension: date_ouv {
    type: string
    sql: ${TABLE}.DATE_OUV ;;
  }

  dimension: ecart_ca {
    type: string
    sql: ${TABLE}.Ecart_CA ;;
  }

  dimension: ecart_jours {
    type: string
    sql: ${TABLE}.Ecart_jours ;;
  }

  dimension: jours {
    type: string
    sql: ${TABLE}.Jours ;;
  }

  dimension: marge_brute {
    type: string
    sql: ${TABLE}.marge_brute ;;
  }

  dimension: marge_n {
    type: number
    sql: ${TABLE}.Marge_N ;;
  }

  dimension: marge_n_1 {
    type: number
    sql: ${TABLE}.Marge_N_1 ;;
  }

  dimension: nb_client {
    type: number
    sql: ${TABLE}.Nb_Client ;;
  }

  dimension: nb_client_n_1 {
    type: number
    sql: ${TABLE}.Nb_client_N_1 ;;
  }

  dimension: nb_clts {
    type: string
    sql: ${TABLE}.nb_clts ;;
  }

  dimension: nb_jour_n_1 {
    type: number
    sql: ${TABLE}.NB_Jour_N_1 ;;
  }

  dimension: nom {
    type: string
    sql: ${TABLE}.NOM ;;
  }

  dimension: nombre_de_jour_n {
    type: number
    sql: ${TABLE}.Nombre_de_jour_N ;;
  }

  dimension: objectif_ca_n {
    type: number
    sql: ${TABLE}.Objectif_CA_N ;;
  }

  dimension: objectif_marge {
    type: number
    sql: ${TABLE}.Objectif_Marge ;;
  }

  dimension: progiciel {
    type: string
    sql: ${TABLE}.PROGICIEL ;;
  }

  dimension: qt___n {
    type: number
    sql: ${TABLE}.Qt___N ;;
  }

  dimension: qt___n_1 {
    type: number
    sql: ${TABLE}.Qt___N_1 ;;
  }

  dimension: qtite {
    type: string
    sql: ${TABLE}.qtite ;;
  }

  dimension: r__gion_____animateur_____dm {
    type: string
    sql: ${TABLE}.R__gion_____Animateur_____DM ;;
  }

  dimension: surf_vte {
    type: string
    sql: ${TABLE}.SURF_VTE ;;
  }

  dimension: typ_mag {
    type: string
    sql: ${TABLE}.TYP_MAG ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
