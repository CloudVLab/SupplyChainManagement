connection: "scl-demo-shared"

# include all the views and dashboards
include: "/dashboard/*"
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



#connection: "bigquery_public_data_looker"

#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
