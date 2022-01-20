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
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
