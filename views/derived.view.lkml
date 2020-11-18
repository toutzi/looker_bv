view: derived {

    derived_table: {
      sql:
           SELECT
               tf_vente.id_tf_vte AS "id_tf_vte"
               , COUNT(*) AS "count"
             FROM tf_vente
             LEFT JOIN article ON tf_vente.id_article=article.id_article
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
