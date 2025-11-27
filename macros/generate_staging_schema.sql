{% macro generate_staging_schema() %}

    {% set models_to_generate = codegen.get_models(directory='staging', prefix='stg_') %}

    {{ codegen.generate_model_yaml(
        model_names = models_to_generate
    ) }}

{% endmacro %}

-- dbt run-operation generate_staging_schema
