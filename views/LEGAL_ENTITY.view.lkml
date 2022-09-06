view: LEGAL_ENTITY {
  sql_table_name: `@{PROJECT}.@{inventory_VISIBILITY}.legal_entity`
    ;;
  drill_fields: [legal_entity_uid]

  dimension: legal_entity_uid {
    primary_key: yes
    type: string
    sql: ${TABLE}.legal_entity_uid ;;
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

  dimension: country {
    type: string
    map_layer_name: countries
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
    type: string
    sql: ${TABLE}.geo_lattitude ;;
  }

  dimension: geo_longitude {
    type: string
    sql: ${TABLE}.geo_longitude ;;
  }
  dimension: house_number {
    type: string
    sql: ${TABLE}.house_number ;;
  }

  dimension: legal_entity_classification {
    type: string
    sql: ${TABLE}.legal_entity_classification ;;
  }

  dimension: legal_entity_group {
    type: string
    sql: ${TABLE}.legal_entity_group ;;
  }

  dimension: legal_entity_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.legal_entity_id ;;
  }

  dimension: legal_entity_name {
    type: string
    sql: ${TABLE}.legal_entity_name ;;
  }

  dimension: legal_entity_name2 {
    type: string
    sql: ${TABLE}.legal_entity_name2 ;;
  }

  dimension: legal_entity_role {
    type: string
    sql: ${TABLE}.legal_entity_role ;;
  }
  dimension: legal_entity_type {
    type: string
    sql: ${TABLE}.legal_entity_type ;;
  }

  dimension: organization_level {
    type: string
    sql: ${TABLE}.organization_level ;;
  }

  dimension: payment_term {
    type: string
    sql: ${TABLE}.payment_term ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postal_code ;;
  }

  dimension: reconcillation_account {
    type: string
    sql: ${TABLE}.reconcillation_account ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: time_zone {
    type: string

    sql: ${TABLE}.time_zone ;;
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

  measure: count {
    type: count
    drill_fields: [legal_entity_uid, legal_entity_name, legal_entity.legal_entity_uid, legal_entity.legal_entity_name, legal_entity.count]
  }
}
