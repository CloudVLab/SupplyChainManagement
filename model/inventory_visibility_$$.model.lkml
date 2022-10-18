connection: "@{CONNECTION}"

# include all the views and dashboards
# include: "/dashboard/*"
include: "/views/*"



datagroup: inventory_visibility_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: inventory_visibility_datagroup

explore: forecast {
  label: "(1)  Forecast - Order - Inventory Analysis"

  join: order {
    type: left_outer
    sql_on: ${forecast.location_uid} = ${order.location_uid}
      and ${forecast.product_uid} = ${order.product_uid} ;;
    relationship: many_to_one
  }

  join: inventory {
    type: left_outer
    sql_on:  ${forecast.location_uid} = ${inventory.location_uid}
      and ${forecast.product_uid} = ${inventory.product_uid};;
    relationship: many_to_one
  }

  join: location {
    type: left_outer
    sql_on:  ${forecast.location_uid} = ${location.location_uid};;
    relationship: many_to_one
  }
  join: product {
    type: left_outer
    sql_on:  ${forecast.product_uid} = ${product.product_uid};;
    relationship: many_to_one
  }
}
