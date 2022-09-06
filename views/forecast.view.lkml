view: forecast {
  sql_table_name: `@{PROJECT}.@{inventory_VISIBILITY}.forecast`
    ;;

  dimension: pk {
    type: string
    primary_key: yes
    sql: CONCAT(${forecast_date},${product_uid},${location_uid}) ;;
  }
  dimension_group: forecast {
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
    sql: ${TABLE}.forecast_date ;;
  }
  dimension: forecast_action_date {
    label: "Date"
    sql: ${TABLE}.forecast_date ;;

    action: {
      label: "Notify through email"
      url: "https://hooks.zapier.com/hooks/catch/11814505/b5cqwxz/"

      form_param: {
        name: "Message"
        type: textarea
        default: "Details#
        Incoming Arrivals :- {{order.total_requested_quantity._value}}
        Projected Sales :- {{total_forecast_quantity._value}}
        Projected Inventory :- {{projected_inventory._value}}
        Valuation :- {{valuation_table._value}}"
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: ""
      }

    }
    action: {
      label: "Setup an urgent meeting"
      url: "https://hooks.zapier.com/hooks/catch/11814505/bryrebp/"

      form_param: {
        name: "Heading"
        type: string
        default: "Let's connect urgently"
      }

      form_param: {
        name: "Description"
        type: textarea
        default: "Details#
        Incoming Arrivals :- {{order.total_requested_quantity._value}}
        Projected Sales :- {{total_forecast_quantity._value}}
        Projected Inventory :- {{projected_inventory._value}}
        Valuation :- {{valuation_table._value}}"
      }

      form_param: {
        name: "Start Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "End Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: ""
      }
    }

  }


  dimension: forecast_period {
    type: string
    sql: ${TABLE}.forecast_period ;;
  }

  dimension: forecast_period_type {
    type: string
    sql: ${TABLE}.forecast_period_type ;;
  }

  dimension: forecast_quantity {
    type: number
    sql: ${TABLE}.forecast_quantity ;;
  }

  dimension: forecast_uom {
    type: string
    sql: ${TABLE}.forecast_uom ;;
  }

  dimension: inventory_quantity {
    type: number
    sql: ${TABLE}.inventory_quantity ;;
  }

  dimension: location_uid {
    type: string
    sql: ${TABLE}.location_uid ;;
  }

  dimension: product_uid {
    type: string
    sql: ${TABLE}.product_uid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

# Derived Fields

  measure: total_forecast_quantity{

    label: "Projected Sales"
    type: sum
    sql: ${TABLE}.forecast_quantity ;;
  }

  measure: projected_inventory{
    label: "Projected Inventory"
    type: sum
    sql: coalesce(${order.requested_quantity},0) - coalesce(${forecast_quantity},0);;
  }



  measure: total_inventory_quantity{
    label: "Current On Hand"
    type: sum
    sql: ${TABLE}.inventory_quantity ;;
  }

  measure: valuation{
    label: "Valuation"
    type: sum
    sql: (coalesce(${order.requested_quantity},0) - coalesce(${forecast_quantity},0)) * (coalesce(${order.sales_price},0)) ;;


    html: </style>
          {% if value < 0 %}
          <div style="color:#e01c21;font-size: 20px">▼ {{rendered_value}}</div>
          {% else %}
          <div style="color:#7CB342;font-size: 20px">▲ {{rendered_value}}</div>
          {% endif %};;
    value_format_name: usd
  }

  measure: valuation_table{
    label: "Valuation"
    type: sum
    sql: (coalesce(${order.requested_quantity},0) - coalesce(${forecast_quantity},0)) * (coalesce(${order.sales_price},0)) ;;
  }

}
