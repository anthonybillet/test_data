view: simple_names {
  derived_table: {
    sql: SELECT full_name_table.name as name ,annotation, timestamp
              FROM `anthony-billet.test_data.simple_names` as full_name_table
              INNER JOIN ( SELECT name,  MAX(timestamp) as max_ts
              FROM `anthony-billet.test_data.simple_names`
              GROUP BY 1) as name_ts
              ON full_name_table.name = name_ts.name AND max_ts = timestamp ;;
  }
  # sql_table_name: `anthony-billet.test_data.simple_names`
  #   ;;

  dimension: annotation {
    type: string
    sql: ${TABLE}.annotation ;;
  }

  dimension_group: timestamp {
    type: time
    datatype: datetime
    sql: ${TABLE}.timestamp ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
    action: {
      label: "Cool Name?"
      url: "https://us-central1-anthony-billet.cloudfunctions.net/ants_cool_name_write_back"

      param: {
        name: "name"
        value: "{{ value }}"
      }

      form_param: {
        name: "annotation"
        type: select
        label: "Cool name?"
        default: "No"
        description: "Do you think that this name is a cool name?"
        option: {
          name: "No"
        }
        option: {
          name: "Yes"
        }
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
