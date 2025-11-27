{% macro generate_core_schema() %}

    {{ codegen.generate_model_yaml(
        model_names = ['core']
    ) }}

{% endmacro %}

-- dbt run-operation generate_core_schema
