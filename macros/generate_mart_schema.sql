{% macro generate_mart_schema() %}


    {% set models_to_generate = codegen.get_models(directory='core', prefix='dim_') %}

    {{ codegen.generate_model_yaml(
        model_names = models_to_generate
    ) }}


{% endmacro %}

-- dbt run-operation generate_mart_schema
