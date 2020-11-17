view: dt_view {

   derived_table: {
     sql: SELECT
         tf_vente.ID_TF_VTE as ID_TF_VTE
         , COUNT(*) as nbre_ventes
         , sum(tf_vente.CA_HT) as CA_HT
         , sum(tf_vente.CA_NET) as CA_NET
         , sum(tf_vente.MARGE_BRUTE) as marge_brute
         , sum(tf_vente.QTITE) as Quantite
         , article.ID_ARTICLE as ID_ARTICLE
         , article_arbo.ID_ART_ARBO as ID_ART_ARBO
       FROM tf_vente
       LEFT JOIN article
       ON tf_vente.ID_ARTICLE=article.ID_ARTICLE
       LEFT JOIN article_arbo
       ON article.ID_ARTICLE=article_arbo.ID_ARTICLE
       GROUP BY 1
       ;;
   }
}
