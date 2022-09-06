view: order {
  sql_table_name: `@{PROJECT}.@{inventory_VISIBILITY}.order`
    ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }

  dimension: actual_delivery_date {
    type: string
    sql: ${TABLE}.actual_delivery_date ;;
  }

  dimension: asset_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.asset_id ;;
  }

  dimension: change_date {
    type: string
    sql: ${TABLE}.change_date ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: confirmed_delivery_date {
    type: string
    sql: ${TABLE}.confirmed_delivery_date ;;
  }

  dimension: confirmed_quantity {
    type: string
    sql: ${TABLE}.confirmed_quantity ;;
  }

  dimension: creation_date {
    type: string
    sql: ${TABLE}.creation_date ;;
  }

  dimension: delivered_quantity {
    type: string
    sql: ${TABLE}.delivered_quantity ;;
  }

  dimension: goodsissue_date_actual {
    type: string
    sql: ${TABLE}.goodsissue_date_actual ;;
  }

  dimension: goodsissue_date_confirmed {
    type: string
    sql: ${TABLE}.goodsissue_date_confirmed ;;
      }

  dimension: goodsissue_date_requested {
    type: string
    sql: ${TABLE}.goodsissue_date_requested ;;
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }

  dimension: key_legal_entity_uid {
    type: string
    sql: ${TABLE}.key_legal_entity_uid ;;
  }

  dimension: location_uid {
    type: string
    sql: ${TABLE}.location_uid ;;
  }

  dimension: mode_of_transport {
    type: string
    sql: ${TABLE}.mode_of_transport ;;
  }

  dimension: open_quantity {
    type: string
    sql: ${TABLE}.open_quantity ;;
  }

  dimension: order_block {
    type: string
    sql: ${TABLE}.order_block ;;
  }
  dimension: order_category {
    type: string
    sql: ${TABLE}.order_category ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }

  dimension: order_uid {
    type: string
    sql: ${TABLE}.order_uid ;;
  }

  dimension: order_uom {
    type: string
    sql: ${TABLE}.order_uom ;;
  }

  dimension: preceding_document {
    type: string
    sql: ${TABLE}.preceding_document ;;
  }

  dimension: product_uid {
    type: string
    sql: ${TABLE}.product_uid ;;
  }

  dimension: received_quantity {
    type: string
    sql: ${TABLE}.received_quantity ;;
  }

  dimension: receiving_location_uid {
    type: string
    sql: ${TABLE}.receiving_location_uid ;;
  }

  dimension: rejected_quantity {
    type: string
    sql: ${TABLE}.rejected_quantity ;;
  }

  dimension: rejection_code {
    type: string
    sql: ${TABLE}.rejection_code ;;
  }

  dimension: requested_delivery_date {
    type: string
    sql: ${TABLE}.requested_delivery_date ;;
  }

  dimension: requested_quantity {
    type: number
    sql: ${TABLE}.requested_quantity ;;
  }

  dimension: route_id {
    type: string
    sql: ${TABLE}.route_id ;;
  }

  dimension: sales_price {
    type: number
    sql: ${TABLE}.sales_price ;;
  }

  dimension: sales_price_currency {
    type: string
    sql: ${TABLE}.sales_price_currency ;;
  }
  dimension: schedule_id {
    type: string
    sql: ${TABLE}.schedule_id ;;
  }

  dimension: shipped_quantity {
    type: string
    sql: ${TABLE}.shipped_quantity ;;
  }

  dimension: shipping_location_uid {
    type: string
    sql: ${TABLE}.shipping_location_uid ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: successor_document {
    type: string
    sql: ${TABLE}.successor_document ;;
  }

  dimension: uid {
    type: string
    sql: ${TABLE}.uid ;;
  }

  dimension: valuation_area {
    type: string
    sql: ${TABLE}.valuation_area ;;
  }
  measure: count {
    type: count
    drill_fields: [order_id, asset.asset_id, asset.asset_name]
  }

  # Derived Fields

  measure: total_requested_quantity{
    label: "Incoming Arrivals"
    type: sum
    sql: ${TABLE}.requested_quantity ;;
  }
}
