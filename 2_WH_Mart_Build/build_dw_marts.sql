-- duckdb dw_marts.duckdb -c ".read build_dw_marts.sql"

-- step 1: dw - create start schema tables
.read 01_create_tables_dw.sql

-- step 2: dw - load data from csv files into tables
.read 02_load_schema_dw.sql 

-- step 3: Mart - create flat mart
.read 03_create_flat_mart.sql 

-- step 4: mart - create skills demand mart
.read 04_create_skills_mart.sql

.read 05_create_priority_mart.sql

-- step 6: mart - update priority mart
.read 06_update_priority_mart.sql

