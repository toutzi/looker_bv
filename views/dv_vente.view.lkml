view: dv_vente {
    derived_table: {
      sql: select
        id_tf_vte,
        id_magasin,
        typ_vente,
        min(DATE(dte_vente)) as dte_vente,
        sum(val_achat_gbl) as couts,
        sum(qtite) as qtite,
        sum(ca_ht) as ca_ht,
        sum(marge_brute) as marge_brute,
        sum(nb_ticket) as nb_clts
      from ods.tf_vente
      group by id_tf_vte, id_magasin, typ_vente
       ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: id_tf_vte {
      type: number
      primary_key: yes
      sql: ${TABLE}.id_tf_vte ;;
    }

    dimension: id_magasin {
      type: number
      sql: ${TABLE}.id_magasin ;;
    }

    dimension: typ_vente {
    type: number
    sql: ${TABLE}.typ_vente ;;
    }

    dimension_group: dte_vente {
      type: time
      timeframes: [date, week, month, year, raw]
      datatype: date
      sql: ${TABLE}.dte_vente ;;
    }

    dimension: couts {
      type: number
      sql: ${TABLE}.couts ;;
    }

    dimension: qtite {
      type: number
      sql: ${TABLE}.qtite ;;
    }

    dimension: ca_ht {
      type: number
      sql: ${TABLE}.ca_ht ;;
    }

    dimension: marge_brute {
      type: number
      sql: ${TABLE}.marge_brute ;;
    }

    dimension: nb_clts {
      type: number
      sql: ${TABLE}.nb_clts ;;
    }




    ########################## Calcul global des KPIs ################################

  measure: sum_ca_ht {
    hidden: yes
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
  }

  measure: count_dte_vente {
    hidden: yes
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.dte_vente ;;
  }

  measure: tot_tx_marge_brute {
    hidden: yes
    type:  number
    value_format_name: percent_2
    sql:  1.0 * ${sum_marge_brute}/NULLIF(${sum_ca_ht},0) ;;
  }

  measure: sum_marge_brute {
    hidden: yes
    value_format_name: decimal_2
    type: sum
    sql: ${marge_brute} ;;
  }

  measure: sum_nb_ticket {
    hidden: yes
    value_format_name: decimal_0
    type: sum
    sql: ${nb_clts} ;;
  }

  measure: sum_qtite {
    hidden: yes
    value_format_name: decimal_0
    type: sum
    sql: ${qtite};;
  }

  measure: sum_val_achat_gbl {
    hidden: yes
    value_format_name: eur
    type: sum
    sql: ${couts} ;;
  }

  filter: date_filter {                 ### Choisir la période qu'on souhaite obtenir les résultats###
    type: date
  }



    ############## calcul des KPIs à la période sélectionnée au niveau du filtre  ############

  measure: sum_CA_select_mois {
    type: sum
    value_format_name: eur
    label: "CA HT"
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: sum_marge_select_mois {
    label: "Marge"
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${marge_brute}
        END ;;
  }

  measure: sum_nb_ticket_select_mois {
    label: "Nb clts"
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${nb_clts}
        END ;;
  }

  measure: sum_nb_jour_select_mois {
    hidden: yes
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${TABLE}.DTE_VENTE
        END ;;
  }

  measure: sum_val_achat_gbl_select_mois {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${couts}
        END ;;
  }

  measure: sum_surf_select_mois {
    hidden: yes
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: sum_CA_drive_select_mois {
    value_format_name: eur
    label: "CA Drive"
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${dv_commandes.sum_total_ht}
        END ;;
  }


     ############ calcul des KPIs à n-1 de la période sélectionnée au niveau du filtre ###############



  measure: sum_CA_select_mois_N1 {
    label: "CA HT n-1"
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: sum_marge_select_mois_N1 {
    label: "Marge n-1"
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${marge_brute}
        END ;;
  }

  measure: sum_nb_ticket_select_mois_N1 {
    label: "Nb clts n-1"
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${nb_clts}
        END ;;
  }

  measure: sum_nb_jour_select_mois_N1 {
    hidden: yes
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${TABLE}.DTE_VENTE
        END ;;
  }

  measure: sum_val_achat_gbl_select_mois_N1 {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${couts}
        END ;;
  }

  measure: sum_surf_select_mois_N1 {
    hidden: yes
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: sum_CA_drive_select_mois_N1 {
    value_format_name: eur
    label: "CA Drive n-1"
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${dv_commandes.sum_total_ht}
        END ;;
  }



   ############## calcul des KPIs à n-2 de la période sélectionnée au niveau du filtre ##############


  measure: sum_CA_select_mois_N2 {
    label: "CA HT n-2"
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: sum_marge_select_mois_N2 {
    label: "Marge n-2"
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${marge_brute}
        END ;;
  }

  measure: sum_nb_ticket_select_mois_N2 {
    label: "Nb clts n-2"
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${nb_clts}
        END ;;
  }

  measure: sum_nb_jour_select_mois_N2 {
    hidden: yes
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${TABLE}.DTE_VENTE
        END ;;
  }

  measure: sum_val_achat_gbl_select_mois_N2 {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${couts}
        END ;;
  }

  measure: sum_surf_select_mois_N2 {
    hidden: yes
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP)  {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: sum_CA_drive_select_mois_N2 {
    hidden: yes
    value_format_name: eur
    label: "CA Drive n-2"
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${dv_commandes.sum_total_ht}
        END ;;
  }



  ######### calcul des rapports entre les KPIs à la période sélectionnée au niveau du filtre  ##########


  measure: client_par_jour_select_mois {
    label: "clts / jour"
    value_format_name: decimal_0
    type: number
    sql: ${sum_nb_ticket_select_mois}/NULLIF(${sum_nb_jour_select_mois},0) ;;
  }

  measure: client_par_jour_select_mois_N1 {
    label: "clts/jr n-1"
    value_format_name: decimal_0
    type: number
    sql: ${sum_nb_ticket_select_mois_N1}/NULLIF(${sum_nb_jour_select_mois_N1},0) ;;
  }

  measure: ca_par_jour_select_mois {
    label: "CA / jour"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois}/NULLIF(${sum_nb_jour_select_mois},0) ;;
  }

  measure: ca_par_jour_select_mois_N1 {
    label: "CA/jr n-1"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois_N1}/NULLIF(${sum_nb_jour_select_mois_N1},0) ;;
  }

  measure: ca_par_m_carre_select_mois {
    label: "CA / m²"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois}/NULLIF(${sum_surf_select_mois},0) ;;
  }

  measure: taux_de_marge_select_mois {
    label: "% marge"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ${sum_marge_select_mois}/NULLIF(${sum_CA_select_mois},0);;
  }

  measure: panier_moyen_select_mois {
    label: "PM"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_select_mois}/NULLIF(${sum_nb_ticket_select_mois},0) ;;
  }

  measure: panier_moyen_drive_select_mois {
    label: "PM Drive"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_drive_select_mois}/NULLIF(${sum_nb_ticket_select_mois},0) ;;
  }

  measure: panier_moyen_select_mois_N1 {
    label: "PM n-1"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_select_mois_N1}/NULLIF(${sum_nb_ticket_select_mois_N1},0) ;;
  }

  measure: panier_moyen_select_mois_N2 {
    label: "PM n-2"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_select_mois_N2}/NULLIF(${sum_nb_ticket_select_mois_N2},0) ;;
  }

  measure: marge_par_client_select_mois {
    label: "marge / clts"
    value_format_name: decimal_2
    type: number
    sql: ${sum_marge_select_mois}/NULLIF(${sum_nb_ticket_select_mois},0) ;;
  }

  measure: marge_par_client_select_mois_N1 {
    label: "marge/clts n-1"
    value_format_name: decimal_2
    type: number
    sql: ${sum_marge_select_mois_N1}/NULLIF(${sum_nb_ticket_select_mois_N1},0) ;;
  }


  ########### Calcul des progressions n / n-1 à la péridode sélectionée au niveau du filtre ###########


  measure: prog_CA_select_mois {
    label: "prog CA"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_CA_select_mois}-${sum_CA_select_mois_N1})/NULLIF(${sum_CA_select_mois_N1},0);;
  }

  measure: prog_CA_drive_select_mois {
    label: "prog CA Drive"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_CA_drive_select_mois}-${sum_CA_drive_select_mois_N1})/NULLIF(${sum_CA_drive_select_mois_N1},0);;
  }

  measure: prog_marge_select_mois {
    label: "prog marge"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${sum_marge_select_mois}-${sum_marge_select_mois_N1})/NULLIF(${sum_marge_select_mois_N1},0);;
  }

  measure: prog_Clients_select_mois {
    label: "prog clts / jr"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${client_par_jour_select_mois}-${client_par_jour_select_mois_N1})/NULLIF(${client_par_jour_select_mois_N1},0) ;;
  }

  measure: prog_ca_jour_select_mois {
    label: "prog CA / jr"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${ca_par_jour_select_mois}-${ca_par_jour_select_mois_N1})/NULLIF(${ca_par_jour_select_mois_N1},0) ;;
  }

  measure: prog_PM_select_mois {
    label: "prog PM"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${panier_moyen_select_mois}-${panier_moyen_select_mois_N1})/(NULLIF(${panier_moyen_select_mois_N1},0));;
  }

  measure: prog_marge_client_select_mois {
    label: "prog marge/clt"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${marge_par_client_select_mois}-${marge_par_client_select_mois_N1})/NULLIF(${marge_par_client_select_mois_N1},0);;
  }

  ######### Calcul des progressions n-1 / n-2 à la péridode sélectionée au niveau du filtre #########

  measure: select_Prog_CA_moisN1 {
    label: "prog CA n-1/n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_CA_select_mois_N1}-${sum_CA_select_mois_N2})/NULLIF(${sum_CA_select_mois_N2},0);;
  }



  set: detail {
    fields: [
      id_tf_vte,
      id_magasin,
      couts,
      qtite,
      ca_ht,
      marge_brute,
      nb_clts
    ]
  }
}
