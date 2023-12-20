
view: sql_runner_query {
  derived_table: {
    sql: :  -- {% assign is_status = _filters['sql_runner_query.orders_status'] | sql_quote %}
             -- {{is_status}}


    SELECT
    orders.status  AS `orders.status`,
    products.brand  AS `products.brand`,
    products.category  AS `products.category`,
    products.department  AS `products.department`
              {% if is_status == "Cancelled" %}
               "A"
              {% elsif is_status == "Complete" %}
              "B"
              {% else %}
              "C"
              {% endif %},
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
      LEFT JOIN demo_db.products  AS products ON inventory_items.product_id = products.id
      GROUP BY
          1,
          2,
          3,
          4
      ORDER BY
          2 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }




  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: products_brand {
    type: string
    sql: ${TABLE}.`products.brand` ;;
  }

  dimension: products_category {
    type: string
    sql: ${TABLE}.`products.category` ;;
  }

  dimension: products_department {
    type: string
    sql: ${TABLE}.`products.department` ;;
  }

  set: detail {
    fields: [
        orders_status,
  products_brand,
  products_category,
  products_department
    ]
  }
}
