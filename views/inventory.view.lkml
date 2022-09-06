view: inventory {
  sql_table_name: `@{PROJECT}.@{inventory_VISIBILITY}.inventory`  ;;

  dimension: pk {
    type: date
    primary_key: yes
    sql: CONCAT(cast(${TABLE}.inventory_date as string),'',${location_uid},'',${product_uid}) ;;
  }

  dimension: batch_number {
    type: string
    sql: ${TABLE}.batch_number ;;
  }

  dimension: inv_gr_date {
    type: string
    sql: ${TABLE}.inv_gr_date ;;
  }

  dimension_group: inv_gr_dates {
    type: time
    timeframes: [
            raw,
      date,
      day_of_year,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: cast(${TABLE}.inv_gr_date as date);;
  }

  dimension: inventory_assignment {
    type: string
    sql: ${TABLE}.inventory_assignment ;;
  }

  dimension: inventory_block {
    type: string
    sql: ${TABLE}.inventory_block ;;
  }

  dimension_group: inventory {
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
    sql: ${TABLE}.inventory_date ;;
  }
  dimension: inventory_ownership {
    type: string
    sql: ${TABLE}.inventory_ownership ;;
  }

  dimension: inventory_quantity {
    type: number
    sql: ${TABLE}.inventory_quantity ;;
  }

  dimension: inventory_type {
    type: string
    sql: ${TABLE}.inventory_type ;;
    html: {% if value == 'finished goods'%}
          <p><img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=15 width=20>{{ rendered_value }}</p>
          {% else %}
          <p><img src="http://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=15 width=20>{{ rendered_value }}</p>
          {% endif %}
          ;;
  }

  dimension: location_uid {
    type: string
    sql: ${TABLE}.location_uid ;;
  }

  dimension: product_uid {
    type: string
    sql: ${TABLE}.product_uid ;;
  }

  dimension: remaining_shelf_life {
    type: string
    sql: ${TABLE}.remaining_shelf_life ;;
  }

  dimension: valuation_area {
    type: string
    sql: ${TABLE}.valuation_area ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

# ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product.product_id,
      product.product_hierarchy_level_2_name,
      product.product_hierarchy_level_1_name,
      product.product_hierarchy_name,
      location.location_id,
      location.location_name
    ]
  }


  dimension: day_in_inventory_tier {
    type: tier
    sql: ${inv_gr_dates_day_of_year} ;;
    style: integer
    tiers: [0,5,10,20,40,80,180,360,500]
  }

  dimension: is_sold {
    type: yesno
    sql: ${inv_gr_dates_raw} is not null ;;
      }

  measure: number_on_hand {
    type: count
    drill_fields: [detail*]

    filters: {
      field: is_sold
      value: "Yes"
    }
  }

  measure: total_inventory_quantity {
    type: sum
    sql: ${inventory_quantity} ;;
  }
}
