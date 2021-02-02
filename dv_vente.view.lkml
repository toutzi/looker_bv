view: dv_vente {
  derived_table: {
    sql: SELECT
       ID_TF_VTE ,
       ID_ARTICLE ,
       ID_MAGASIN ,
       DATE(DTE_VENTE) as dte_vente,
       CA_HT ,
       MARGE_BRUTE ,
       NB_TICKET ,
       QTITE ,
       VAL_ACHAT_GBL as couts

      FROM `ods.tf_vente`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_tf_vte {
    type: number
    sql: ${TABLE}.ID_TF_VTE ;;
  }

  dimension: id_article {
    type: number
    sql: ${TABLE}.ID_ARTICLE ;;
  }

  dimension: id_magasin {
    type: number
    sql: ${TABLE}.ID_MAGASIN ;;
  }

  dimension: dte_vente {
    type: date
    datatype: date
    sql: ${TABLE}.dte_vente ;;
  }

  dimension: ca_ht {
    type: number
    sql: ${TABLE}.CA_HT ;;
  }

  dimension: marge_brute {
    type: number
    sql: ${TABLE}.MARGE_BRUTE ;;
  }

  dimension: nb_ticket {
    type: number
    sql: ${TABLE}.NB_TICKET ;;
  }

  dimension: qtite {
    type: number
    sql: ${TABLE}.QTITE ;;
  }

  dimension: couts {
    type: number
    sql: ${TABLE}.couts ;;
  }

  set: detail {
    fields: [
      id_tf_vte,
      id_article,
      id_magasin,
      dte_vente,
      ca_ht,
      marge_brute,
      nb_ticket,
      qtite,
      couts
    ]
  }
}
