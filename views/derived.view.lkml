view: derived {

    derived_table: {
      sql:
           SELECT
               tf.id_tf_vte AS "id_tf_vte"
               , COUNT(DISTINCT tf.id_tf_vte) AS "count"
             FROM tf_vente AS tf
             LEFT JOIN article ON tf_vente.id_article=article.id_article
             LEFT JOIN article_arbo ON article.id_article=article_arbo.id_article
             GROUP BY 1
             ;;
    }

    dimension: id_tf_vte {
      type: number
      sql: ${TABLE}.id_tf_vte ;;
    }

    dimension: CA_HT {
      type: number
      sql: ${TABLE}.CA_HT ;;
    }

    dimension: nbre_ventes {
      type: number
      sql: ${TABLE}.count ;;
    }

 }
