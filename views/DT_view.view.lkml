view: dt_view {

   derived_table: {
     sql: SELECT
         tf_vente.ID_TF_VTE as ID_TF_VTE
         , COUNT(*) as nbre_ventes
         , sum(tf_vente.CA_HT) as CA_HT
         , article_arbo.ID_ART_ARBO as ID_ART_ARBO
       FROM tf_vente
       LEFT JOIN article
       ON tf_vente.ID_ARTICLE=article.ID_ARTICLE
       LEFT JOIN article_arbo
       ON article.ID_ARTICLE=article_arbo.ID_ARTICLE
       GROUP BY 1
       ;;
   }

  dimension: ID_TF_VTE {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.ID_TF_VTE ;;
  }

  dimension: CA_HT {
    type: number
    hidden: yes
    sql: ${TABLE}.CA_HT ;;
  }

  dimension: nbre_ventes {
    type: number
    hidden: yes
    sql: ${TABLE}.nbre_ventes ;;
  }

  dimension: ID_ART_ARBO {
    type: number
    hidden: yes
    sql: ${TABLE}.ID_ART_ARBO ;;
  }


}
