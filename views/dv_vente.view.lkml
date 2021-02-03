view: dv_vente {
    derived_table: {
      sql: select
        id_tf_vte,
        id_article,
        id_magasin,
        typ_vente,
        min(DATE(dte_vente)) as dte_vente,
        sum(val_achat_gbl) as couts,
        sum(qtite) as qtite,
        sum(ca_ht) as ca_ht,
        sum(marge_brute) as marge_brute,
        sum(nb_ticket) as nb_clts
      from ods.tf_vente
      where typ_vente = 0
      group by id_tf_vte, id_article, id_magasin, typ_vente
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

    dimension: id_article {
      type: number
      sql: ${TABLE}.id_article ;;
    }

    dimension: id_magasin {
      type: number
      sql: ${TABLE}.id_magasin ;;
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
    label: "CA HT"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
  }

  measure: count_dte_vente {
    label:"Nb de jrs"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.dte_vente ;;
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
    sql: ${marge_brute} ;;
  }

  measure: sum_nb_ticket {
    label: "Nb clts"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_clts} ;;
  }

  measure: sum_qtite {
    label: "Qtés"
    value_format_name: decimal_0
    type: sum
    sql: ${qtite};;
  }

  measure: sum_val_achat_gbl {
    label: "coûts"
    value_format_name: eur
    type: sum
    sql: ${couts} ;;
  }

  filter: date_filter {                 ### Pour filtrer sur la date qu'on souhaite obtenir les résultats###
    type: date
  }

    ######################### calcul des indicateurs du mois N année N  #####################

  measure: sum_ca_ht_moisN {
    label: "CA HT mois N"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [dte_vente_date: "last month"]
  }

  measure: sum_nb_ticket_moisN {
    label: "Nb clients mois N"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_clts} ;;
    filters: [ dte_vente_date: "last month"]
  }

  measure: Nb_de_jours_moisN {
    type: count_distinct
    label: "Nb de jours mois N"
    value_format_name: decimal_0
    sql: ${TABLE}.dte_vente  ;;
    filters: [dte_vente_date: "last month"]
  }

  measure: sum_val_achat_gbl_moisN {
    label: "val achat gbl mois N"
    value_format_name: eur
    type: sum
    sql: ${couts} ;;
    filters: [dte_vente_date: "last month"]
  }

  measure: CA_selected_month {
    type: sum
    value_format_name: eur
    label: "CA ht"
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: nb_ticket_selected_month {
    label: "Nb clts "
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${nb_clts}
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

  measure: surf_selected_month {
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: val_achat_gbl_selected_month {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${couts}
        END ;;
  }


   ############################# calcul des indicateurs du mois N année N-1  ########################

  measure: sum_ca_ht_moisN1 {
    label: "CA mois N-1"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [dte_vente_date: "13 months ago"]
  }

  measure: sum_nb_ticket_moisN1 {
    label: "Nb clients mois N-1"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_clts} ;;
    filters: [dte_vente_date: "13 months ago"]
  }

  measure: Nb_de_jours_mois_N1 {
    label: "Nb de jours mois N-1"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.dte_vente  ;;
    filters: [dte_vente_date:"13 months ago"]
  }

  measure: sum_val_achat_gbl_moisN1 {
    label: "val achat gbl mois N-1"
    value_format_name: eur
    type: sum
    sql: ${couts} ;;
    filters: [dte_vente_date: "13 months ago"]
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

  measure: nb_ticket_month_ly {
    label: "Nb clts n-1"
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${nb_clts}
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

  measure: surf_month_ly {
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: val_achat_gbl_month_ly {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 1 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${couts}
        END ;;
  }


   ######################### calcul des indicateurs du mois N année N-2  ##########################

  measure: sum_ca_ht_moisN2 {
    label: "CA mois N-2"
    type: sum
    value_format_name: eur
    drill_fields: [detail*]
    sql: ${ca_ht} ;;
    filters: [dte_vente_date: "26 months ago"]
  }

  measure: sum_nb_ticket_moisN2 {
    label: "Nb clients mois N-2"
    value_format_name: decimal_0
    type: sum
    sql: ${nb_clts} ;;
    filters: [dte_vente_date: "26 months ago"]
  }

  measure: Nb_de_jours_mois_N2 {
    label: "Nb de jours mois N-2"
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.dte_vente  ;;
    filters: [dte_vente_date: "26 months ago"]
  }

  measure: sum_val_achat_gbl_moisN2 {
    label: "val achat gbl mois N-2"
    value_format_name: eur
    type: sum
    sql: ${couts} ;;
    filters: [dte_vente_date: "26 months ago"]
  }

  measure: CA_month_ly_2 {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${ca_ht}
        END ;;
  }

  measure: nb_ticket_month_ly2 {
    label: "Nb clts n-2"
    type: sum
    value_format_name: decimal_0
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${nb_clts}
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

  measure: surf_month_ly2 {
    type: sum
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${magasin.surf_vte}
        END ;;
  }

  measure: val_achat_gbl_month_ly2 {
    type: sum
    value_format_name: eur
    sql: CASE
          WHEN {% condition date_filter %} CAST(DATE_ADD(DATE(${dte_vente_date}), INTERVAL 2 YEAR) AS TIMESTAMP) {% endcondition %}
          THEN ${couts}
        END ;;
  }








    set: detail {
      fields: [
        id_tf_vte,
        id_article,
        id_magasin,
        couts,
        qtite,
        ca_ht,
        marge_brute,
        nb_clts
      ]
    }
  }
