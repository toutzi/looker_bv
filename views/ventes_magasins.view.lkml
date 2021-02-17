view: ventes_magasins {
    derived_table: {
      sql: select
        m.cd_magasin,
        m.cd_pays,
        m.nom,
        m.surf_vte,
        m.date_ouv,
        m.typ_mag as Type,
        v.typ_vente,
        v.dte_vente,
        sum(v.val_achat_gbl) as couts,
        sum(v.qtite) as qtite,
        sum(v.ca_ht) as ca_ht,
        sum(v.marge_brute) as marge_brute,
        sum(v.nb_ticket) as nb_clts
      from ods.tf_vente v
      left join magasin m
      on v.ID_MAGASIN = m.ID_MAGASIN
      group by 1,2,3,4,5,6,7,8
 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: cd_magasin {
      primary_key: yes
      type: string
      sql: ${TABLE}.cd_magasin ;;
    }

    dimension: cd_pays {
      type: string
      sql: ${TABLE}.cd_pays ;;
    }

    dimension: nom {
      type: string
      sql: ${TABLE}.nom ;;
    }

    dimension: surf_vte {
      type: number
      sql: ${TABLE}.surf_vte ;;
    }

    dimension_group: date_ouv {
      type: time
      timeframes: [date, week, week_of_year ,month, month_name , year, raw]
      datatype: date
      sql: ${TABLE}.date_ouv ;;
    }

    dimension: type {
      type: string
      sql: ${TABLE}.Type ;;
    }

    dimension: typ_vente {
      type: number
      sql: ${TABLE}.typ_vente ;;
    }

    dimension_group: dte_vente {
      type: time
      timeframes: [date, week, week_of_year ,month, month_name , year, raw]
      datatype: datetime
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


  filter: date_filter {                 ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n"
    type: date
  }

  measure: sum_CA_drive_select_mois {
    type: sum
    value_format_name: eur
    label: "CA Drive"
    sql: CASE
          WHEN {% condition date_filter %} CAST(${dte_vente_date} AS TIMESTAMP)  {% endcondition %}
          THEN ${web.total_ht}
        END ;;
  }



    set: detail {
      fields: [
        cd_magasin,
        cd_pays,
        nom,
        surf_vte,
        date_ouv_date,
        type,
        typ_vente,
        dte_vente_date,
        couts,
        qtite,
        ca_ht,
        marge_brute,
        nb_clts
      ]
    }
  }
