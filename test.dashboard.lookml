---
- dashboard: schedule_deliveries_dashbaord
  title: schedule deliveries dashbaord
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: KsY2yDYrbVwsi51bQpkQjn
  elements:
  - title: schedule deliveries dashbaord
    name: schedule deliveries dashbaord
    model: khushbu_s_project_repo
    explore: order_items
    type: table
    fields: [products.brand, products.id, products.count, orders.created_date]
    sorts: [orders.created_date desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${products.count}"
      label: test_count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: test_count
      _type_hint: number
    query_timezone: America/Los_Angeles
    listen: {}
    row:
    col:
    width:
    height:
