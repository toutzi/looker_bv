view: tf_vente {
  sql_table_name: `ods.tf_vente`
    ;;

  dimension: an_sem {
    type: string
    sql: ${TABLE}.AN_SEM ;;
  }

  dimension: annee {
    type: string
    sql: ${TABLE}.ANNEE ;;
  }

  dimension: ca_ht {
    type: number
    value_format_name: "eur"
    sql: ${TABLE}.CA_HT;;
  }

  measure: sum_ca_ht {
    label: "Chiffre d'affaires"
    type: sum
    value_format_name: "eur"
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
  }

  dimension: ca_net {
    type: number
    value_format_name: "eur"
    sql: ${TABLE}.CA_NET ;;
  }

  measure: sum_ca_net {
    type: sum
    label: "CA NET"
    value_format_name: "eur"
    drill_fields: [detail*]
    sql: ${ca_net} ;;
  }

  dimension: cd_niv1 {
    type: string
    sql: ${TABLE}.CD_NIV1 ;;
  }

  dimension: cd_niv2 {
    type: string
    sql: ${TABLE}.CD_NIV2 ;;
  }

  dimension: cd_niv3 {
    type: string
    sql: ${TABLE}.CD_NIV3 ;;
  }

  dimension: cd_pays {
    type: string
    sql: ${TABLE}.CD_PAYS ;;
  }

  dimension: cd_site_ext {
    type: string
    sql: ${TABLE}.CD_SITE_EXT ;;
  }

  dimension: desc_article {
    type: string
    sql: ${TABLE}.DESC_ARTICLE ;;
  }

  dimension_group: dte_creat {
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
    sql: ${TABLE}.DTE_CREAT ;;
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

  measure: count_dte_vente {
    label:"Nombre de jour"
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
  }

  dimension: id_article {
    type: number
    sql: ${TABLE}.ID_ARTICLE ;;
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.ID_MAGASIN ;;
  }

  dimension: id_tf_vte {
    type: number
    primary_key: yes
    sql: ${TABLE}.ID_TF_VTE ;;
  }

  measure: count_id_tf_vte {
    label: "Nombre de lignes de vente"
    type: count_distinct
    sql: ${TABLE}.ID_TF_VTE ;;
  }

  dimension: jour {
    type: string
    sql: ${TABLE}.JOUR ;;
  }

  dimension: marge_brute {
    type: number
    sql: ${TABLE}.MARGE_BRUTE ;;
  }

  dimension: tx_marge_brute {
    type:  number
    sql: ${marge_brute}/${ca_ht} ;;
  }

  measure: tot_tx_marge_brute {
    label: "Taux Marge brute"
    type:  number
    sql: ${marge_brute})/${ca_ht} ;;
  }

  measure: sum_marge_brute {
    label: "Marge brute"
    type: sum
    sql: ${TABLE}.MARGE_BRUTE ;;
  }

  dimension: mois {
    type: string
    sql: ${TABLE}.MOIS ;;
  }

  dimension: nb_ticket {
    type: number
    sql: ${TABLE}.NB_TICKET ;;
  }

  measure: sum_nb_ticket {
    label: "nb client"
    type: sum
    sql: ${TABLE}.NB_TICKET ;;
  }

  dimension: num_jour {
    type: string
    sql: ${TABLE}.NUM_JOUR ;;
  }

  dimension: num_niv1 {
    type: string
    sql: ${TABLE}.NUM_NIV1 ;;
  }

  dimension: num_niv2 {
    type: string
    sql: ${TABLE}.NUM_NIV2 ;;
  }

  dimension: num_niv3 {
    type: string
    sql: ${TABLE}.NUM_NIV3 ;;
  }

  dimension: qtite {
    type: number
    sql: ${TABLE}.QTITE ;;
  }

  measure: sum_qtite {
    label: "Qtés"
    type: sum
    sql: ${TABLE}.QTITE ;;
  }

  dimension: qtite_uvc {
    type: number
    sql: ${TABLE}.QTITE_UVC ;;
  }

  measure: sum_qtite_uvc {
    type: sum
    sql: ${TABLE}.QTITE_UVC ;;
  }
  dimension: statut_article {
    type: string
    sql: ${TABLE}.STATUT_ARTICLE ;;
  }

  dimension: typ_article {
    type: string
    sql: ${TABLE}.TYP_ARTICLE ;;
  }

  dimension: typ_vente {
    type: number
    sql: ${TABLE}.TYP_VENTE ;;
  }

  dimension: val_achat_gbl {
    type: number
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
  }

  measure: sum_val_achat_gbl {
    label: "coûts"
    type: sum
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  set: detail {
    fields: [id_tf_vte, id_article, id_magasin]
  }
}
