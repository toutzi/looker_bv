view: derived {

    derived_table: {
      sql:
           SELECT
               id_tf_vte AS "id_tf_vte"
             FROM tf_vente
             LEFT JOIN article ON tf_vente.id_article=article.id_article
             ;;
    }

    dimension: id_tf_vte {
      type: number
      sql: ${TABLE}.id_tf_vte ;;
    }


    dimension: nbre_ventes {
      type: number
      sql: ${TABLE}.count ;;
    }

 }
