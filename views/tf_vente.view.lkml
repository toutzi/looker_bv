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

  measure: sum_ca_ht_N {
    label: "CA N"
    type: sum
    value_format_name: "eur"
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_year: "this year"]
  }

  measure: sum_ca_ht_no {
    label: "CA"
    type: sum
    value_format_name: "eur"
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0"]
  }

  measure: sum_ca_ht_N_1 {
    label: "CA N-1"
    type: sum
    value_format_name: "eur"
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_year: "2 years ago"]
  }

  measure: sum_ca_ht_N_2 {
    label: "CA N-2"
    type: sum
    value_format_name: "eur"
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_year: "3 years ago"]
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
    sql: ${sum_marge_brute}/${sum_ca_ht} ;;
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

  measure: sum_nb_ticket0 {
    label: "Nb client / an"
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0"]
  }

  measure: sum_nb_ticket_N1 {
    label: "Nb client N-1"
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0", dte_vente_year: "2 years ago"]
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

  measure: sum_val_achat_gbl0 {
    type: sum
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
    filters: [typ_vente: "0"]
  }

  measure: sum_val_achat_gbl_N1 {
    type: sum
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
    filters: [typ_vente: "0"]
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: Nb_de_jours_N {
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_month: "12 months"]
  }

  measure: Nb_de_jours {
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0"]
  }

  measure: Nb_de_jours_N_1 {
    label: "Nb de jours N-1"
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_month: "24 months"]
  }

  measure: Nb_de_jours_N_2 {
    label: "Nb de jours N-2"
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_month: "36 months"]
  }

  measure: Prog_CA {
    label: "Prog CA"
    type: number
    sql: (${sum_ca_ht}-${sum_ca_ht_N_1})/${sum_ca_ht_N_1};;
    value_format_name: "percent_2"
  }

  measure: ca_par_jour_annee {
    label: "CA / jour/ Année"
    sql: ${sum_ca_ht_no}/${Nb_de_jours} ;;
  }

  measure: Prog_CA_1 {
    label: "Prog.CA"
    type: number
    sql: ((${sum_ca_ht_N}/${Nb_de_jours_N})-(${sum_ca_ht_N_1}/${Nb_de_jours_N_1}))/(${sum_ca_ht_N_1}/${Nb_de_jours_N_1});;
    value_format_name: "percent_2"
  }

  measure: CA_m_carre {
    label: "CA au m²"
    sql: ${sum_ca_ht_no}/${magasin.sum_surf_vte} ;;
  }

  measure: Taux_de_marge {
    label: "Taux de marge Année"
    sql: (${sum_ca_ht_no}-${sum_val_achat_gbl0})/${sum_ca_ht_no};;
    value_format_name: "percent_2"
  }

  measure: Taux_de_marge_N1 {
    label: "Taux de marge Année N-1"
    sql: (${sum_ca_ht_N_1}-${sum_val_achat_gbl_N1})/${sum_ca_ht_N_1};;
    value_format_name: "percent_2"
  }

  measure: prog_marge {
    label: "Prog Marge"
    sql: ((${sum_ca_ht_no}-${sum_val_achat_gbl0})-(${sum_ca_ht_N_1}-${sum_val_achat_gbl_N1}))/(${sum_ca_ht_N_1}-${sum_val_achat_gbl_N1}) ;;
  }

  measure: Nb_clt_Annee {
    label: "Nb client / an"
    sql:  ;;
  }

  measure: Nb_moy_client {
    label: "Nb moyen clients"
    sql: ${sum_nb_ticket0}/${Nb_de_jours};;
  }

  measure: panier_moyen {
    label: "panier moyen"
    sql: ${sum_ca_ht_no}/${sum_nb_ticket0} ;;
  }

  measure: panier_moyen_N1 {
    label: "panier moyen N-1"
    sql: ${sum_ca_ht_N_1}/${sum_nb_ticket_N1};;
  }

  set: detail {
    fields: [id_tf_vte, id_article, id_magasin]
  }
}
