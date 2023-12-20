view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: week_week {
    type: string
    sql: ${created_week} ;;
  }

  filter: filter_week {
    type: string
    suggest_dimension: week_week
  }

  dimension: week_satisfies_filter {
    type: yesno
    hidden: yes
    sql: {% condition filter_week %} ${week_week} {% endcondition %} ;;
  }

  measure: avg_filtered_week {
    type: average
    filters: [week_satisfies_filter: "yes"]
    sql: ${user_id};;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
    #html: {{status._rendered_value }} ;;
  }

  measure: test_count {
    type: sum
    sql: ${user_id} ;;
  }

  measure: percent_of_total {
    type: number
    sql: ${count}/SUM(${id}) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
