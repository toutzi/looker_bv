view: dv_tf_vente {
  derived_table: {
    sql: select
        id_tf_vte,
        id_article,
        id_magasin,
        min(DATE(dte_vente)) as dte_vente,
        sum(val_achat_gbl) as couts,
        sum(qtite) as qtite,
        sum(ca_ht) as ca_ht,
        sum(marge_brute) as marge_brute,
        sum(nb_ticket) as nb_clts
      from ods.tf_vente
      where typ_vente = 0
      group by id_tf_vte, id_article, id_magasin
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

  dimension: dte_vente {
    type: date
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

  set: detail {
    fields: [
      id_tf_vte,
      id_article,
      id_magasin,
      dte_vente,
      couts,
      qtite,
      ca_ht,
      marge_brute,
      nb_clts
    ]
  }
}
