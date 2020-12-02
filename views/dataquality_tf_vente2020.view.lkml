view: dataquality_tf_vente2020 {
  sql_table_name: `bureauvallee.ods.dataquality_tf_vente2020`
    ;;

  dimension: ca_net {
    type: number
    sql: ${TABLE}.CA_NET ;;
  }

  dimension: cd_pays {
    type: string
    sql: ${TABLE}.CD_PAYS ;;
  }

  dimension: completude_ca_net_tfvente {
    type: number
    sql: ${TABLE}.Completude_CA_Net_tfvente ;;
  }

  dimension_group: dte_vente {
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
    sql: ${TABLE}.DTE_VENTE ;;
  }

  dimension: flag_anomalie_ratio_median_magglobal {
    type: number
    sql: ${TABLE}.Flag_Anomalie_Ratio_median_magglobal ;;
  }

  dimension: flag_ca_net_null {
    type: number
    sql: ${TABLE}.Flag_CA_Net_NULL ;;
  }

  dimension: flag_qtite_null {
    type: number
    sql: ${TABLE}.Flag_QTITE_NULL ;;
  }

  dimension: Flag_QTITE_CANET_NULL {
    type: number
    sql: ${TABLE}.Flag_QTITE_CANET_NULL ;;
  }

  dimension: flag_qtite_sup1000_canet_inf0_5 {
    type: number
    sql: ${TABLE}.Flag_QTITE_SUP1000_CANET_INF0_5 ;;
  }

  dimension: id_article {
    type: number
    sql: ${TABLE}.ID_ARTICLE ;;
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.ID_MAGASIN ;;
  }

  dimension: prix_median_theo_par_mag {
    type: number
    sql: ${TABLE}.prix_median_theo_par_mag ;;
  }

  dimension: prix_theo_median_global {
    type: number
    sql: ${TABLE}.prix_theo_median_global ;;
  }

  dimension: prix_unitaire_net {
    type: number
    sql: ${TABLE}.PRIX_UNITAIRE_NET ;;
  }

  dimension: qtite {
    type: number
    sql: ${TABLE}.QTITE ;;
  }

  dimension: qtite_neg {
    type: number
    sql: ${TABLE}.QTITE_NEG ;;
  }

  dimension: ratio_median_magglobal {
    type: number
    sql: ${TABLE}.Ratio_median_magglobal ;;
  }

  dimension: ratio_median_magglobal_tier {
    type: tier
    tiers: [0,0.1,0.3,3,10,100,10000000]
    drill_fields: [id_article,id_magasin, ca_net,qtite]
    sql: ${TABLE}.Ratio_median_magglobal ;;
  }

  dimension: score_anomalie {
    type: number
    sql: ${TABLE}.score_anomalie ;;
  }

  measure: Nb_ecart {
    type: sum
    drill_fields: [id_magasin, id_article, ca_net, qtite, score_anomalie, ratio_median_magglobal]
    sql: ${TABLE}.Flag_ecart ;;
  }
}
