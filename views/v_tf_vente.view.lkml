view: v_tf_vente {
  sql_table_name: `ods.v_tf_vente`
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
    value_format_name: eur
    sql: ${TABLE}.CA_HT;;
  }

  measure: sum_ca_ht {
    label: "CA HT"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
  }

  measure: sum_ca_ht_N {
    label: "CA HT année N"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_date: "this year"]
  }

  measure: sum_ca_ht_no {
    label: "CA"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0"]
  }

  measure: sum_ca_ht_N_1 {
    label: "CA HT année N-1"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_date: "2 years ago"]
  }

  measure: sum_ca_ht_N_2 {
    label: "CA HT année N-2"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_date:  "3 years ago"]
  }

  measure: sum_ca_ht_moisN {
    label: "CA HT mois N"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_date: "last month"]
  }

  measure: sum_ca_ht_moisN1 {
    label: "CA mois N-1"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_date: "13 months ago"]
  }

  measure: sum_ca_ht_moisN2 {
    label: "CA mois N-2"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [typ_vente: "0", dte_vente_date: "26 months ago"]
  }


  dimension: ca_net {
    type: number
    value_format_name: eur
    sql: ${TABLE}.CA_NET ;;
  }

  measure: sum_ca_net {
    type: sum
    label: "CA NET"
    value_format_name: eur
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
      week_of_year,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DTE_VENTE ;;
  }

  measure: count_dte_vente {
    label:"Nombre de jours"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.ID_MAGASIN ;;
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
    label: "Tx Marge brute"
    type:  number
    value_format_name: percent_2
    sql:  1.0 * ${sum_marge_brute}/NULLIF(${sum_ca_ht},0) ;;
  }

  measure: sum_marge_brute {
    label: "Marge brute"
    value_format_name: decimal_2
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
    label: "nbre clients"
    value_format_name: decimal_0
    type: sum
    sql: ${TABLE}.NB_TICKET ;;
  }

  measure: sum_nb_ticket0 {
    label: "Nb clients"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0"]
  }

  measure: sum_nb_ticket_N {
    label: "Nb clients année N"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0", dte_vente_date: "this year"]
  }

  measure: sum_nb_ticket_N1 {
    label: "Nb clients année N-1"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0", dte_vente_date: "2 years ago"]
  }

  measure: sum_nb_ticket_N2 {
    label: "Nb clients année N-2"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0", dte_vente_date: "3 years ago"]
  }

  measure: sum_nb_ticket_moisN {
    label: "Nb clients mois N"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0", dte_vente_date: "last month"]
  }

  measure: sum_nb_ticket_moisN1 {
    label: "Nb clients mois N-1"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0", dte_vente_date: "13 months ago"]
  }

  measure: sum_nb_ticket_moisN2 {
    label: "Nb clients mois N-2"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
    filters: [typ_vente: "0", dte_vente_date: "26 months ago"]
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
    value_format_name: decimal_0
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
    value_format_name: eur
    type: sum
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
  }

  measure: sum_val_achat_gbl0 {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
    filters: [typ_vente: "0"]
  }

  measure: sum_val_achat_gbl_N {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
    filters: [typ_vente: "0", dte_vente_date:"this year"]
  }

  measure: sum_val_achat_gbl_N1 {
    value_format_name: eur
    type: sum
    sql: ${TABLE}.VAL_ACHAT_GBL ;;
    filters: [typ_vente: "0", dte_vente_date:"2 years ago"]
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: Nb_de_jours_N0 {
    label: "Nb de jours N"
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0"]
  }

  measure: Nb_de_jours {
    type: count_distinct
    value_format_name: decimal_0
    sql: ${TABLE}.DTE_VENTE ;;
  }


  measure: Nb_de_jours_N {
    type: count_distinct
    value_format_name: decimal_0
    label: "Nb de jours année N"
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_date: "this year"]
  }

  measure: Nb_de_jours_N_1 {
    label: "Nb de jours année N-1"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_date:"2 years ago"]
  }

  measure: Nb_de_jours_N_2 {
    label: "Nb de jours année N-2"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_date: "3 years ago"]
  }

  measure: Nb_de_jours_moisN {
    type: count_distinct
    label: "Nb de jours mois N"
    value_format_name: decimal_0
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_date: "last month"]
  }

  measure: Nb_de_jours_mois_N1 {
    label: "Nb de jours mois N-1"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_date:"13 months ago"]
  }

  measure: Nb_de_jours_mois_N2 {
    label: "Nb de jours mois N-2"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.DTE_VENTE ;;
    filters: [typ_vente: "0", dte_vente_date: "26 months ago"]
  }

  measure: Prog_CA {
    label: "Prog CA année N"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_N}-${sum_ca_ht_N_1})/NULLIF(${sum_ca_ht_N_1},0);;
  }

  measure: Prog_CA_mois {
    label: "Prog CA N/N-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_moisN}-${sum_ca_ht_moisN1})/NULLIF(${sum_ca_ht_moisN1},0);;
  }

  measure: select_Prog_CA_mois {
    label: "prog CA n/n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${CA_selected_month}-${CA_month_ly})/NULLIF(${CA_month_ly},0);;
  }

  measure: Prog_CA_moisN1 {
    label: "Prog CA N-1/N-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_moisN1}-${sum_ca_ht_moisN2})/NULLIF(${sum_ca_ht_moisN2},0);;
  }

  measure: select_Prog_CA_moisN1 {
    label: "prog CA n-1/n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${CA_month_ly}-${CA_month_ly_2})/NULLIF(${CA_month_ly_2},0);;
  }

  measure: client_par_jour {
    label: "Clients / jour"
    value_format_name: decimal_0
    type: number
    sql: ${sum_nb_ticket0}/NULLIF(${Nb_de_jours_N0},0) ;;
  }

  measure: select_client_par_jour {
    label: "clts / jr"
    value_format_name: decimal_0
    type: number
    sql: ${nb_ticket_selected_month}/NULLIF(${nb_jour_selected_month},0) ;;
  }

  measure: select_client_par_jour_N1 {
    label: "clts / jr n-1"
    value_format_name: decimal_0
    type: number
    sql: ${nb_ticket_month_ly}/NULLIF(${nb_jour_month_ly},0) ;;
  }

  measure: ca_par_jour_annee {
    label: "CA / jour/ Année"
    value_format_name: eur
    type: number
    sql:  ${sum_ca_ht_no}/NULLIF(${Nb_de_jours_N0},0) ;;
  }

  measure: ca_par_jour_mois {
    label: "CA/jour moyen"
    value_format_name: eur
    type: number
    sql:  ${sum_ca_ht_no}/NULLIF(${Nb_de_jours_N0},0) ;;
  }

  measure: select_ca_par_jour_mois {
    label: "CA / jr moy"
    value_format_name: eur
    type: number
    sql:  ${CA_selected_month}/NULLIF(${nb_jour_selected_month},0) ;;
  }

  measure: select_ca_par_jour_moisN1 {
    label: "CA / jr moy n-1"
    value_format_name: eur
    type: number
    sql:  ${CA_month_ly}/NULLIF(${nb_jour_month_ly},0) ;;
  }

  measure: Prog_CA_1 {
    label: "Prog.CA N-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_ca_ht_N}/NUULIF(${Nb_de_jours_N},0))-(${sum_ca_ht_N_1}/NULLIF(${Nb_de_jours_N_1},0)))/(${sum_ca_ht_N_1}/NULLIF(${Nb_de_jours_N_1},0));;
  }

  measure: Prog_Clients {
    label: "Prog clts / jour année N"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_nb_ticket_N}/NULLIF(${Nb_de_jours_N},0))-(${sum_nb_ticket_N1}/NULLIF(${Nb_de_jours_N_1},0)))/(${sum_nb_ticket_N1}/NULLIF(${Nb_de_jours_N_1}),0));;
  }

  measure: Prog_Clients_moisN {
    label: "Prog clients / jourr"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_nb_ticket_moisN}/NULLIF(${Nb_de_jours_moisN},0))-(${sum_nb_ticket_moisN1}/NULLIF(${Nb_de_jours_mois_N1},0)))/(${sum_nb_ticket_moisN1}/NULLIF(${Nb_de_jours_mois_N1},0));;
  }

  measure: select_Prog_Clients_moisN {
    label: "prog clts / jr"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${select_client_par_jour}-${select_client_par_jour_N1})/NULLIF(${select_client_par_jour_N1},0) ;;
  }

  measure: Prog_ca_jour {
    label: "Prog CA / jour année N"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_no}/NULLIF(${Nb_de_jours_N0},0))-(${sum_ca_ht_N_1}/NULLIF(${Nb_de_jours_N_1},0)))/(${sum_ca_ht_N_1}/NULLIF(${Nb_de_jours_N_1}),0));;
  }

  measure: Prog_ca_jour_moisN {
    label: "Prog CA / jour"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_ca_ht_moisN}/NULLIF(${Nb_de_jours_moisN},0))-(${sum_ca_ht_moisN1}/NULLIF(${Nb_de_jours_mois_N1},0)))/(${sum_ca_ht_moisN1}/NULLIF(${Nb_de_jours_mois_N1},0));;
  }

  measure: select_Prog_ca_jour_moisN {
    label: "prog CA / jr"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${select_ca_par_jour_mois}-${select_ca_par_jour_moisN1})/NULLIF(${select_ca_par_jour_moisN1},0) ;;
  }

  measure: CA_m_carre {
    label: "CA au m²"
    value_format_name: eur
    type: number
    sql:  ${sum_ca_ht_no}/NULLIF(${sum_surf_vte},0) ;;
  }

  measure: sum_surf_vte {
    type: sum
    sql: ${magasin.surf_vte};;
    filters:  [typ_vente: "0", dte_vente_date:"13 months ago"]
  }

  measure: CA_carre {
    label: "CA au m² moyen"
    value_format_name: eur
    type: number
    sql:  ${sum_ca_ht_moisN1}/NULLIF(${sum_surf_vte},0) ;;
  }

  measure: select_CA_m_carre {
    label: "CA / m²"
    value_format_name: eur
    type: number
    sql:  ${CA_selected_month}/NULLIF(${surf_selected_month},0) ;;
  }

  measure: Taux_de_marge {
    label: "Tx de marge"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_no}-${sum_val_achat_gbl0})/NULLIF(${sum_ca_ht_no},0);;
  }

  measure: Taux_de_marge_moisN {
    label: "% Marge"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_moisN}-${sum_val_achat_gbl_moisN})/NULLIF(${sum_ca_ht_moisN},0);;
  }

  measure: select_Taux_de_marge_moisN {
    label: "% marge"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${CA_selected_month}-${val_achat_gbl_selected_month})/NULLIF(${CA_selected_month},0);;
  }

  measure: Taux_de_marge_N1 {
    label: "Taux de marge Année N-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_N_1}-${sum_val_achat_gbl_N1})/NULLIF(${sum_ca_ht_N_1},0);;
  }

  measure: Taux_de_marge_moisN1 {
    label: "Tx de marge mois N-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_ca_ht_moisN1}-${sum_val_achat_gbl_moisN1})/NULLIF(${sum_ca_ht_moisN1},0);;
  }

  measure: select_Taux_de_marge_moisN1 {
    label: "tx de marge mois n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${CA_month_ly}-${val_achat_gbl_month_ly})/NULLIF(${CA_month_ly},0);;
  }

  measure: prog_marge {
    label: "Prog Marge Année N"
    value_format_name: percent_2
    type: number
    sql:  1.0 * ((${sum_ca_ht_N}-${sum_val_achat_gbl_N})-(${sum_ca_ht_N_1}-${sum_val_achat_gbl_N1}))/NULLIF((${sum_ca_ht_N_1}-${sum_val_achat_gbl_N1}),0) ;;
  }

  measure: prog_marge_moisN {
    label: "Prog Marge N/N-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_ca_ht_moisN}-${sum_val_achat_gbl_moisN})-(${sum_ca_ht_moisN1}-${sum_val_achat_gbl_moisN1}))/NULLIF((${sum_ca_ht_moisN1}-${sum_val_achat_gbl_moisN1}),0) ;;
  }

  measure: select_prog_marge_moisN {
    label: "prog marge n/n-1"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${select_Taux_de_marge_moisN}-${select_Taux_de_marge_moisN1})/NULLIF(${select_Taux_de_marge_moisN1},0);;
  }

  measure: Nb_moy_client {
    label: "Nb moyen clts"
    value_format_name: decimal_0
    type: number
    sql:  ${sum_nb_ticket0}/NULLIF(${Nb_de_jours},0);;
  }

  measure: Nb_moy_client_moisN {
    label: "clients/jour moyen"
    value_format_name: decimal_0
    type: number
    sql:  ${sum_nb_ticket_moisN1}/NULLIF(${Nb_de_jours_mois_N1},0);;
  }

  measure: select_Nb_moy_client_moisN {
    label: "clts / jr moy"
    value_format_name: decimal_0
    type: number
    sql:  ${nb_ticket_selected_month}/NULLIF(${nb_jour_selected_month},0);;
  }

  measure: Prog_clients_jour_moisN {
    label: "Prog Clts / jour"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_nb_ticket_moisN}/NULLIF(${Nb_de_jours_moisN},0))-(${sum_nb_ticket_moisN1}/NULLIF(${Nb_de_jours_mois_N1},0)))/(${sum_nb_ticket_moisN1}/NULLIF(${Nb_de_jours_mois_N1},0));;
  }

  measure: panier_moyen {
    label: "panier moyen"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_ca_ht_no}/NULLIF(${sum_nb_ticket0},0) ;;
  }

  measure: panier_moyen_moisN {
    label: "PM"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_ca_ht_moisN}/NULLIF(${sum_nb_ticket_moisN},0) ;;
  }

  measure: select_panier_moyen_moisN {
    label: "PM"
    value_format_name: decimal_2
    type: number
    sql:  ${CA_selected_month}/NULLIF(${nb_ticket_selected_month},0) ;;
  }

  measure: panier_moyen_N1 {
    label: "panier moyen année N-1"
    value_format_name: decimal_2
    type: number
    sql: ${sum_ca_ht_N_1}/NULLIF(${sum_nb_ticket_N1},0);;
  }

  measure: panier_moyen_moisN1 {
    label: "panier moyen mois N-1"
    value_format_name: decimal_2
    type: number
    sql: ${sum_ca_ht_moisN1}/NULLIF(${sum_nb_ticket_moisN1},0);;
  }

  measure: select_panier_moyen_moisN1 {
    label: "PM mois n-1"
    value_format_name: decimal_2
    type: number
    sql: ${CA_month_ly}/NULLIF(${nb_ticket_month_ly},0);;
  }

  measure: Prog_PM {
    label: "Prog panier moyen année N"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_ca_ht_N}/NULLIF(${sum_nb_ticket_N},0))-(${sum_ca_ht_N_1}/NULLIF(${sum_nb_ticket_N1},0)))/(${sum_ca_ht_N_1}/NULLIF(${sum_nb_ticket_N1},0));;
  }

  measure: Prog_PM_moisN {
    label: "Prog PM N/N-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ((${sum_ca_ht_moisN}/NULLIF(${sum_nb_ticket_moisN},0))-(${sum_ca_ht_moisN1}/NULLIF(${sum_nb_ticket_moisN1},0)))/(${sum_ca_ht_moisN1}/NULLIF(${sum_nb_ticket_moisN1},0));;
  }

  measure: select_Prog_PM_moisN {
    label: "prog PM n/n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${select_panier_moyen_moisN}-${select_panier_moyen_moisN1})/(NULLIF(${select_panier_moyen_moisN1},0));;
  }

  measure: Marges {
    value_format_name: decimal_2
    type: number
    sql: ${sum_ca_ht}-${sum_val_achat_gbl} ;;
  }

  measure: Marges_client_moisN {
    label: "Marge / clts"
    value_format_name: decimal_2
    type: number
    sql: (${sum_ca_ht_moisN}-${sum_val_achat_gbl_moisN})/NULLIF(${sum_nb_ticket_moisN},0) ;;
  }

  measure: select_Marges_client_moisN {
    label: "marge / clts"
    value_format_name: decimal_2
    type: number
    sql: (${CA_selected_month}-${val_achat_gbl_selected_month})/NULLIF(${nb_ticket_selected_month},0) ;;
  }

  measure: Marges_client_moisN1 {
    value_format_name: decimal_2
    type: number
    sql: (${sum_ca_ht_moisN1}-${sum_val_achat_gbl_moisN1})/NULLIF(${sum_nb_ticket_moisN1},0) ;;
  }

  measure: select_Marges_client_moisN1 {
    value_format_name: decimal_2
    type: number
    sql: (${CA_month_ly}-${val_achat_gbl_month_ly})/NULLIF(${nb_ticket_month_ly},0) ;;
  }

  measure: Prog_Marge_client {
    label: "Prog Marge/clt"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${Marges_client_moisN}-${Marges_client_moisN1})/NULLIF(${Marges_client_moisN1},0);;
  }

  measure: select_Prog_Marge_client {
    label: "prog marge/clt"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${select_Marges_client_moisN}-${select_Marges_client_moisN1})/NULLIF(${select_Marges_client_moisN1},0);;
  }

  measure: Marges_N {
    label: "Marge mois N"
    value_format_name: decimal_2
    type: number
    sql: ${sum_ca_ht_moisN}-${sum_val_achat_gbl_moisN} ;;
  }

  measure: select_Marges_N {
    label: "marge mois n"
    value_format_name: decimal_2
    type: number
    sql: ${CA_selected_month}-${val_achat_gbl_selected_month};;
  }

  measure: Marges_N1 {
    label: "Marge mois N-1"
    value_format_name: decimal_2
    type: number
    sql: ${sum_ca_ht_moisN1}-${sum_val_achat_gbl_moisN1} ;;
  }

  measure: selectMarges_N1 {
    label: "marge mois n-1"
    value_format_name: decimal_2
    type: number
    sql: ${CA_month_ly}-${val_achat_gbl_month_ly} ;;
  }


  measure: sum_val_achat_gbl_moisN {
    label: "val achat gbl mois N"
    value_format_name: eur
    type: sum
    sql: ${val_achat_gbl} ;;
    filters: [typ_vente: "0", dte_vente_date: "last month"]
  }

  measure: sum_val_achat_gbl_moisN1 {
    label: "val achat gbl mois N-1"
    value_format_name: eur
    type: sum
    sql: ${val_achat_gbl} ;;
    filters: [typ_vente: "0", dte_vente_date: "13 months ago"]
  }

  measure: sum_val_achat_gbl_moisN2 {
    label: "val achat gbl mois N-2"
    value_format_name: eur
    type: sum
    sql: ${val_achat_gbl} ;;
    filters: [typ_vente: "0", dte_vente_date: "26 months ago"]
  }

#  parameter: date_filter {
#    type: date
#  }

  filter: date_filter {
    type: date
  }

#  measure: spend_year_to_selected_date {
#    type: sum
#    value_format_name: eur
#    sql:
#      CASE
#        WHEN EXTRACT(YEAR FROM CAST({% parameter date_filter %} AS DATE)) = EXTRACT(YEAR FROM ${dte_vente_date})
#        THEN ${ca_ht}
#      END ;;
#  }


#  measure: spend_month_to_selected_date {
#    type: sum
#    value_format_name: eur
#    sql:
#      CASE
#        WHEN EXTRACT(MONTH FROM CAST({% parameter date_filter %} AS DATE)) = EXTRACT(MONTH FROM ${dte_vente_date})
#        AND EXTRACT(YEAR FROM CAST({% parameter date_filter %} AS DATE)) = EXTRACT(YEAR FROM ${dte_vente_date})
#        THEN ${ca_ht}
#      END ;;
#  }

  measure: CA_selected_month {
    type: sum
    value_format_name: eur
    label: "CA ht"
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: CA_month_ly {
    type: sum
    label: "CA ht n-1"
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: CA_month_ly_2 {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: nb_ticket_selected_month {
    label: "Nb clts "
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${nb_ticket}
        END ;;
  }

  measure: nb_ticket_month_ly {
    label: "Nb clts n-1"
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${nb_ticket}
        END ;;
  }

  measure: nb_ticket_month_ly2 {
    label: "Nb clts n-2"
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${nb_ticket}
        END ;;
  }

  measure: nb_jour_selected_month {
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${TABLE}.DTE_VENTE
        END ;;
  }

  measure: nb_jour_month_ly {
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${TABLE}.DTE_VENTE
        END ;;
  }

  measure: nb_jour_month_ly2 {
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${TABLE}.DTE_VENTE
        END ;;
  }

  measure: surf_selected_month {
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: surf_month_ly {
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: val_achat_gbl_selected_month {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${val_achat_gbl}
        END ;;
  }

  measure: val_achat_gbl_month_ly {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${val_achat_gbl}
        END ;;
  }

  measure: val_achat_gbl_month_ly2 {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${val_achat_gbl}
        END ;;
  }

  measure: Rang_CA {
    sql: RANK() OVER (
          PARTITION BY ${id_magasin}
          ORDER BY ${CA_selected_month} DESC) ;;
  }


  set: detail {
    fields: [id_magasin]
  }
}
