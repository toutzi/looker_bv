view: dervived_table {
  derived_table: {
    sql: SELECT v.ID_TF_VTE,
      sum(v.CA_HT) AS CA_HT ,
      COUNT(v.DTE_VENTE) AS Nbre_de_ventes,
      sum(v.MARGE_BRUTE) AS Marge_Brute,
      sum(v.NB_TICKET) AS Nbre_Clients,
      sum(v.QTITE) AS Qtes,
      sum(v.VAL_ACHAT_GBL) AS Couts,
      sum(m.SURF_VTE) AS surf_vente,
FROM `bureauvallee.ods.tf_vente` v
LEFT JOIN `bureauvallee.ods.magasin` m ON v.ID_MAGASIN = m.ID_MAGASIN
GROUP BY 1
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

  dimension: ca_ht {
    type: number
    sql: ${TABLE}.CA_HT ;;
  }

  dimension: nbre_de_ventes {
    type: number
    sql: ${TABLE}.Nbre_de_ventes ;;
  }

  dimension: marge_brute {
    type: number
    sql: ${TABLE}.Marge_Brute ;;
  }

  dimension: nbre_clients {
    type: number
    sql: ${TABLE}.Nbre_Clients ;;
  }

  dimension: qtes {
    type: number
    sql: ${TABLE}.Qtes ;;
  }

  dimension: couts {
    type: number
    sql: ${TABLE}.Couts ;;
  }

  dimension: surf_vente {
    type: number
    sql: ${TABLE}.surf_vente ;;
  }

  set: detail {
    fields: [
      id_tf_vte,
      ca_ht,
      nbre_de_ventes,
      marge_brute,
      nbre_clients,
      qtes,
      couts,
      surf_vente
    ]
  }
}
