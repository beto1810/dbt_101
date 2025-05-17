{% macro get_discount_eligibility(NUMBER_OF_ORDERS, TOTAL_AMOUNT_SPENT_USD ) %}
    CASE
        WHEN {{ NUMBER_OF_ORDERS }} >= 3 OR {{ TOTAL_AMOUNT_SPENT_USD }} >= 300 THEN TRUE
        ELSE FALSE
    END
{% endmacro %}

