view: table_update {
  derived_table: {
    sql: select
      m.CD_MAGASIN,
      m.NOM,
      m.TYP_MAG,
      m.SURF_VTE,
      m.CD_PAYS,
      v.DTE_VENTE,
      v.STATUT_ARTICLE,
      sum(v.CA_HT) as ca_ht,
      sum(v.MARGE_BRUTE) as marge_brute,
      sum(v.NB_TICKET) as nb_clts,
      sum(v.QTITE) as qtite,
      sum(v.VAL_ACHAT_GBL) as couts
      from ods.tf_vente v
      left join magasin m
      on v.ID_MAGASIN = m.ID_MAGASIN
      group by 1,2,3,4,5,6,7
UNION ALL
select * from `bureauvallee.ods.test_update`
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.CD_MAGASIN ;;
  }

  dimension: nom {
    type: string
    sql: ${TABLE}.NOM ;;
  }

  dimension: typ_mag {
    type: string
    sql: ${TABLE}.TYP_MAG ;;
  }

  dimension: surf_vte {
    type: number
    sql: ${TABLE}.SURF_VTE ;;
  }

  dimension: cd_pays {
    type: string
    sql: ${TABLE}.CD_PAYS ;;
  }

  dimension: dte_vente {
    type: date
    datatype: date
    sql: ${TABLE}.DTE_VENTE ;;
  }

  dimension: statut_article {
    type: string
    sql: ${TABLE}.STATUT_ARTICLE ;;
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

  dimension: qtite {
    type: number
    sql: ${TABLE}.qtite ;;
  }

  dimension: couts {
    type: number
    sql: ${TABLE}.couts ;;
  }

  set: detail {
    fields: [
      cd_magasin,
      nom,
      typ_mag,
      surf_vte,
      cd_pays,
      dte_vente,
      statut_article,
      ca_ht,
      marge_brute,
      nb_clts,
      qtite,
      couts
    ]
  }
}
