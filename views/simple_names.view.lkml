view: simple_names {
  sql_table_name: `anthony-billet.test_data.simple_names`
    ;;

  dimension: cool_name {
    label: "Cool Name?"
    type: yesno
    sql: ${TABLE}.Cool_Name_ ;;
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
