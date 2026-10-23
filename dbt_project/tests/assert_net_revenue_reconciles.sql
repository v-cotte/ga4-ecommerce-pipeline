-- Net revenue must equal gross revenue minus refunds (allowing for rounding).
-- Returns failing rows.
select
    event_date,
    gross_revenue,
    refund_amount,
    net_revenue
from {{ ref('daily_metrics') }}
where abs(net_revenue - (gross_revenue - refund_amount)) > 0.02
