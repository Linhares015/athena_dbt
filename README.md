# athena_dbt

python3 -m venv venv

source venv/bin/activate

sudo apt-get install libpq-dev python3-dev build-essential

pip install psycopg2-binary

echo dbt-core > requirements.txt
echo dbt-postgres >> requirements.txt
pip install -r requirements.txt


dbt docs generate
dbt docs serve

Usar o Comando dbt run-operation generate_source:

O comando dbt run-operation generate_source é uma macro que pode ser usada para gerar a configuração YAML de um esquema inteiro.

Primeiro, adicione a macro generate_source ao seu projeto, se ainda não estiver presente. Crie um arquivo macros/generate_source.sql e adicione o seguinte conteúdo:

sql
Copiar código
{% macro generate_source(schema_name) %}
{{ dbt_utils.generate_source(
    schema_name=schema_name
) }}
{% endmacro %}

Executar a Macro:

Execute a macro para gerar o YAML do seu esquema específico:

sh
Copiar código
dbt run-operation generate_source --args '{"schema_name": "seu_esquema"}'