view: dt_view {

   derived_table: {
     sql:
     SELECT
         tf.id_tf_vte AS "id_tf_vte"
         , COUNT(*) AS "nbre_ventes"
       FROM tf_vente AS tf
       LEFT JOIN article ON tf_vente.id_article=article.id_article
       LEFT JOIN article_arbo ON article.id_article=article_arbo.id_article
       GROUP BY 1
       ;;
   }

  dimension: id_tf_vte {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.id_tf_vte ;;
  }

  dimension: CA_HT {
    type: number
    hidden: yes
    sql: ${TABLE}.CA_HT ;;
  }

  dimension: nbre_ventes {
    type: number
    sql: ${TABLE}.nbre_ventes ;;
  }


}
