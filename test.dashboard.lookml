---
- dashboard: test_schedule_deliveries_dashboard_
  title: 'test_schedule_deliveries_dashboard '
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: nuHvunfz4yD2QRHqyqAQbz
  elements:
  - title: 'test_schedule_deliveries_dashboard '
    name: 'test_schedule_deliveries_dashboard '
    model: khushbu_s_project_repo
    explore: order_items
    type: looker_grid
    fields: [products.brand, products.id, products.count, orders.created_date, average_of_cost]
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
    - category: measure
      expression:
      label: Average of Cost
      value_format:
      value_format_name:
      based_on: inventory_items.cost
      _kind_hint: measure
      measure: average_of_cost
      type: average
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
