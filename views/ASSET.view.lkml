view: ASSET {
  sql_table_name: `@{PROJECT}.@{inventory_VISIBILITY}.asset`
    ;;
  drill_fields: [asset_id]

  dimension: asset_id {
    primary_key: yes
    type: string
    description: "Asset ID is unique identifier for a particular type of Asset"
    sql: ${TABLE}.asset_id ;;
  }

  dimension: active {
    type: string
    description: "Location Validity"
    sql: ${TABLE}.active ;;
  }

  dimension: asset_capacity {
    type: number
    description: "Asset Capacity"
    sql: ${TABLE}.asset_capacity ;;
  }

  dimension: asset_location {
    type: string
    description: "Location ID"
    sql: ${TABLE}.asset_location ;;
  }

  dimension: asset_name {
    type: string
    description: "Description of an asset"
    sql: ${TABLE}.asset_name ;;
  }

  dimension: asset_ownership {
    type: string
    description: "Legal Entity for ownership"
    sql: ${TABLE}.asset_ownership ;;
  }

  dimension: asset_type {
    type: string
    description: "Asset type is to segregate assets - Production Machine, Transaportation Equipment, Handling Eqipment"
    sql: ${TABLE}.asset_type ;;
  }

  dimension: asset_uid {
    type: string
    description: "Asset ID is unique identifier for a particular type of Asset"
    sql: ${TABLE}.asset_uid ;;
  }

  dimension_group: change {
    type: time
    description: "Change Date"
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
    sql: ${TABLE}.change_date ;;
  }

  dimension_group: creation {
    type: time
    description: "Creation Date"
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
    sql: ${TABLE}.creation_date ;;
  }

  dimension: uuid {
    type: string
    description: "Unique Identifier for the record"
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: valid_from {
    type: time
    description: "Valid from date"
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
    sql: ${TABLE}.valid_from_date ;;
  }

  dimension_group: valid_to {
    type: time
    description: "Valid to date"
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
    sql: ${TABLE}.valid_to_date ;;
  }

  dimension: valuation_area {
    type: string
    description: "Valuation Entity for financial reporting"
    sql: ${TABLE}.valuation_area ;;
  }

  measure: count {
    type: count
    drill_fields: [asset_id, asset_name, order.count]
  }
}
