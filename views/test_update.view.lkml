view: test_update {
    sql_table_name: `bureauvallee.ods.test_update`
      ;;

    dimension: ca_ht {
      type: number
      sql: ${TABLE}.ca_ht ;;
    }

    dimension: cd_magasin {
      type: string
      sql: ${TABLE}.CD_MAGASIN ;;
    }

    dimension: cd_pays {
      type: string
      sql: ${TABLE}.CD_PAYS ;;
    }

    dimension: couts {
      type: number
      sql: ${TABLE}.couts ;;
    }

    dimension_group: dte_vente {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.DTE_VENTE ;;
    }

    dimension: marge_brute {
      type: number
      sql: ${TABLE}.marge_brute ;;
    }

    dimension: nb_clts {
      type: number
      sql: ${TABLE}.nb_clts ;;
    }

    dimension: nom {
      type: string
      sql: ${TABLE}.NOM ;;
    }

    dimension: qtite {
      type: number
      sql: ${TABLE}.qtite ;;
    }

    dimension: statut_article {
      type: string
      sql: ${TABLE}.STATUT_ARTICLE ;;
    }

    dimension: surf_vte {
      type: number
      sql: ${TABLE}.SURF_VTE ;;
    }

    dimension: typ_mag {
      type: string
      sql: ${TABLE}.TYP_MAG ;;
    }

    measure: sum_ca_ht  {
      type: sum
      drill_fields: [details*]
      value_format_name: eur
      sql: ${ca_ht} ;;
    }

    measure: count {
      type: count
      value_format_name: decimal_0
      drill_fields: [details*]
    }

    set: details {
      fields: [
        cd_magasin,
        nom,
        ca_ht
      ]
    }
  }
