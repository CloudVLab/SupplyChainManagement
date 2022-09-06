view: location {
  sql_table_name: `@{PROJECT}.@{inventory_VISIBILITY}.location`
    ;;
  drill_fields: [location_id]

  dimension: location_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }

  dimension: change_date {
    type: string
    sql: ${TABLE}.change_date ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: country {
    type: string
    # map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: creation_date {
    type: string
    sql: ${TABLE}.creation_date ;;
  }

  dimension: district {
    type: string
    sql: ${TABLE}.district ;;

  }

  dimension: geo_lattitude {
    type: number
    sql: ${TABLE}.geo_lattitude ;;
  }

  dimension: geo_longitude {
    type: number
    sql: ${TABLE}.geo_longitude ;;
  }

  dimension: house_number {
    type: string
    sql: ${TABLE}.house_number ;;
  }

  dimension: language_key {
    type: string
    sql: ${TABLE}.language_key ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }

  dimension: location_name2 {
    type: string
    sql: ${TABLE}.location_name2 ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }
  dimension: location_uid {
    type: string
    sql: ${TABLE}.location_uid ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postal_code ;;
  }

  dimension: receiving_calendar {
    type: string
    sql: ${TABLE}.receiving_calendar ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: shipping_calendar {
    type: string
    sql: ${TABLE}.shipping_calendar ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: transportation_zone {
    type: string
    sql: ${TABLE}.transportation_zone ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: valid_from_date {
    type: string
    sql: ${TABLE}.valid_from_date ;;
  }

  dimension: valid_to_date {
    type: string
    sql: ${TABLE}.valid_to_date ;;
  }

  dimension: valuation_area {
    type: string
    sql: ${TABLE}.valuation_area ;;
  }

  dimension: working_hour {
    type: string
    sql: ${TABLE}.working_hour ;;
  }

  measure: count {
    type: count
    drill_fields: [location_id, location_name]
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.geo_lattitude ;;
    sql_longitude: ${TABLE}.geo_longitude ;;

  }
}
