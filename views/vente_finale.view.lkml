view: sql_runner_query {
  derived_table: {
    sql: WITH dv_vente AS (select
        id_tf_vte,
        id_magasin,
        typ_vente,
        dte_vente as dte_vente,
        sum(val_achat_gbl) as couts,
        sum(qtite) as qtite,
        sum(ca_ht) as ca_ht,
        sum(marge_brute) as marge_brute,
        sum(nb_ticket) as nb_clts
      from ods.tf_vente
      group by id_tf_vte, id_magasin, typ_vente, dte_vente
       )
SELECT
  magasin.CD_MAGASIN  AS magasin_cd_magasin,
  magasin.NOM  AS magasin_nom,
  magasin.TYP_MAG  AS magasin_typ_mag,
  CAST(magasin.DATE_OUV  AS DATE) AS magasin_date_ouv_date,
  magasin.SURF_VTE  AS magasin_surf_vte,
  dv_vente.typ_vente  AS dv_vente_typ_vente,
  CAST(CAST(dv_vente.dte_vente  AS TIMESTAMP) AS DATE) AS dv_vente_dte_vente_date,
  COALESCE(SUM(CAST(dv_vente.marge_brute AS FLOAT64)), 0) AS sum_of_marge_brute,
  COALESCE(SUM(CAST(dv_vente.nb_clts AS FLOAT64)), 0) AS sum_of_nb_clts,
  COALESCE(SUM(CAST(dv_vente.qtite AS FLOAT64)), 0) AS sum_of_qtite,
  COALESCE(SUM(CAST(dv_vente.ca_ht AS FLOAT64)), 0) AS sum_of_ca_ht,
  COALESCE(SUM(CAST(dv_vente.couts AS FLOAT64)), 0) AS sum_of_couts,
  CAST(max(dv_vente.dte_vente)  AS DATE) AS dv_vente_max_dte_vente,
  CAST(max((CASE
          WHEN 1=1 -- no filter on 'dv_vente.date_filter'

          THEN (CAST(CAST(dv_vente.dte_vente  AS TIMESTAMP) AS DATE))
        END
))  AS DATE) AS dv_vente_max_filter_date,
  CAST(min((CASE
          WHEN 1=1 -- no filter on 'dv_vente.date_filter_3'

          THEN (CAST(CAST(dv_vente.dte_vente  AS TIMESTAMP) AS DATE))
        END
))  AS DATE) AS dv_vente_min_filter_date_3
FROM dv_vente
LEFT JOIN `ods.magasin`
     AS magasin ON dv_vente.id_magasin=magasin.ID_MAGASIN

GROUP BY 1,2,3,4,5,6,7
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: magasin_cd_magasin {
    type: string
    sql: ${TABLE}.magasin_cd_magasin ;;
  }

  dimension: magasin_nom {
    type: string
    sql: ${TABLE}.magasin_nom ;;
  }

  dimension: magasin_typ_mag {
    type: string
    sql: ${TABLE}.magasin_typ_mag ;;
  }

  dimension: magasin_date_ouv_date {
    type: date
    datatype: date
    sql: ${TABLE}.magasin_date_ouv_date ;;
  }

  dimension: magasin_surf_vte {
    type: number
    sql: ${TABLE}.magasin_surf_vte ;;
  }

  dimension: dv_vente_typ_vente {
    type: number
    sql: ${TABLE}.dv_vente_typ_vente ;;
  }

  dimension_group: dv_vente_dte_vente_date {
    type: time
    timeframes: [date, week, week_of_year ,month, month_name , year, raw, fiscal_month_num, fiscal_quarter, fiscal_quarter_of_year, fiscal_year]
    datatype: date
    sql: ${TABLE}.dv_vente_dte_vente_date ;;
  }

  dimension: sum_of_marge_brute {
    type: number
    sql: ${TABLE}.sum_of_marge_brute ;;
  }

  dimension: sum_of_nb_clts {
    type: number
    sql: ${TABLE}.sum_of_nb_clts ;;
  }

  dimension: sum_of_qtite {
    type: number
    sql: ${TABLE}.sum_of_qtite ;;
  }

  dimension: sum_of_ca_ht {
    type: number
    sql: ${TABLE}.sum_of_ca_ht ;;
  }

  dimension: sum_of_couts {
    type: number
    sql: ${TABLE}.sum_of_couts ;;
  }

  dimension: dv_vente_max_dte_vente {
    type: date
    datatype: date
    sql: ${TABLE}.dv_vente_max_dte_vente ;;
  }

  dimension: dv_vente_max_filter_date {
    type: date
    datatype: date
    sql: ${TABLE}.dv_vente_max_filter_date ;;
  }

  dimension: dv_vente_min_filter_date_3 {
    type: date
    datatype: date
    sql: ${TABLE}.dv_vente_min_filter_date_3 ;;
  }

  filter: date_filter {                 ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n"
    type: date
  }

  filter: date_filter_1 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-1"
    type: date
  }

  filter: date_filter_2 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-2"
    type: date
  }

  filter: date_filter_3 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-3"
    type: date
  }

  dimension_group: filter_date {
    type: time
    timeframes: [date, week, month, year, raw]
    datatype: date
    sql: CASE
            WHEN {% condition date_filter %} CAST(${dv_vente_dte_vente_date_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${dv_vente_dte_vente_date_date}
          END ;;
  }

  dimension_group: filter_date_3 {
    type: time
    timeframes: [date, week, month, year, raw]
    datatype: date
    sql: CASE
            WHEN {% condition date_filter_3 %} CAST(${dv_vente_dte_vente_date_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${dv_vente_dte_vente_date_date}
          END ;;
  }


  dimension: diff_date {
    type: number
    sql: DATE_DIFF(${dv_vente_max_filter_date}, ${magasin_date_ouv_date}, YEAR) ;;
  }

  #dimension: diff_date {
  #  type: number
  #  sql: DATE_DIFF(${filter_date_date}, ${magasin.date_ouv_date}, YEAR) ;;
  #}

  dimension: categorie {
    label: "Catégorie"
    sql:
        CASE
          WHEN ${magasin_date_ouv_date} <= ${dv_vente_min_filter_date_3} AND ${dv_vente_max_dte_vente} >= ${dv_vente_max_filter_date} THEN "P. comparable"
          ELSE "P.non comparable"
        END
      ;;
  }

  dimension: anciennete {
    label: "Ancienneté"
    sql:
        CASE
          WHEN  ${diff_date} <= 2 THEN "A≤2 ans"
          WHEN  ${diff_date} <= 5 AND ${diff_date}> 2 THEN "2 ans<A≤ 5 ans"
          WHEN  ${diff_date} <= 10 AND ${diff_date} > 5 THEN "5 ans<A≤10 ans"
          WHEN  ${diff_date} > 10 THEN "A>10 ans"
        END
      ;;
  }

  set: detail {
    fields: [
      magasin_cd_magasin,
      magasin_nom,
      magasin_typ_mag,
      magasin_date_ouv_date,
      magasin_surf_vte,
      dv_vente_typ_vente,
      sum_of_marge_brute,
      sum_of_nb_clts,
      sum_of_qtite,
      sum_of_ca_ht,
      sum_of_couts,
      dv_vente_max_dte_vente,
      dv_vente_max_filter_date,
      dv_vente_min_filter_date_3
    ]
  }
}
