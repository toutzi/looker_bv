view: deriv_table {
  derived_table: {
    sql: SELECT
       id_tf_vte,
       COUNT(distinct tf_vente.id_tf_vte) AS nbre_ventes,
       FROM ods.tf_vente
       LEFT JOIN ods.magasin ON tf_vente.id_magasin = magasin.id_magasin
       LEFT JOIN ods.article ON tf_vente.id_article  = article.id_article
       LEFT JOIN ods.article_arbo ON article.id_article = article_arbo.id_article
       LEFT JOIN ods.n4 ON article_arbo.id_n4_n4 = n4.id_n4_n4
       GROUP BY 1
       LIMIT 10
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_tf_vte {
    type: number
    sql: ${TABLE}.id_tf_vte ;;
  }

  dimension: nbre_ventes {
    type: number
    sql: ${TABLE}.nbre_ventes ;;
  }

  set: detail {
    fields: [id_tf_vte, nbre_ventes]
  }
}
