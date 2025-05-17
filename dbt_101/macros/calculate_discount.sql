{% macro calculate_discount(is_eligible,NUMBER_OF_ORDERS, TOTAL_AMOUNT_SPENT_USD ) %}
    CASE
        WHEN {{ is_eligible }} = TRUE and {{ NUMBER_OF_ORDERS }} > 3 THEN {{ TOTAL_AMOUNT_SPENT_USD }} * 0.05
        WHEN {{ is_eligible }} = TRUE and {{ NUMBER_OF_ORDERS }} <= 3 THEN {{ TOTAL_AMOUNT_SPENT_USD }} * 0.03
        ELSE 0
    END
{% endmacro %}

