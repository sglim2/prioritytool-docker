# Use an existing image as the base image
FROM python:3.9-slim-buster

# Provide code maintainers name
LABEL maintainer="Sarah Harwood"

# Set the working directory in the container
WORKDIR /Prioritization-Tool

RUN apt-get update && apt-get install -y libodbc1 bash

#
# 20230328: SQLAlchemy v2.0.0 has removed Engine.execute method that was called by read_sql_query pandas function. Use sqlalchemy<2.0 instead
RUN pip install \
  Flask \
  aiohttp \
  fastparquet \
  jsonschema \
  openpyxl \
  pandas \
  pyarrow \
  pyodbc \
  requests \
  sqlalchemy==1.4.47

# Copy the application code to the container
COPY . .

# Run the install.bat file
#RUN bash ./install.sh

# Specify the command to run when the container starts
CMD ["bash", "./install.sh"]

