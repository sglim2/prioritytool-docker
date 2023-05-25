#!/bin/bash 


# contains database information
source install.params

#pip install pyodbc Flask pandas sqlalchemy
#pip install jsonschema

cd Prioritization-Tool

# Set up config.ini file
python config_setup.py ${MARIADB_HOST} ${MARIADB_DATABASE} ${MARIADB_USER} ${MARIADB_PASSWORD} ${cites_key} ${iucn_key}

# Set up required data and files for app
python generate_metadata.py
python database_setup/taxonomy/generate_tax_rep.py
python database_setup/get_api_data.py
python database_setup/generate_dataframes.py
python database_setup/upload_to_sql.py
python database_setup/cache_database.py
python database_setup/cache_scored_data.py

flask run --host=0.0.0.0
