-- Array

with skills as (
SELECT 'python' as skill
UNION ALL 
SELECT 'sql'  
UNION ALL 
SELECT 'r'  
), skills_array as (
    select ARRAY_AGG(skill ORDER BY skill) AS skills
    FROM skills
)

select 
    skills[1] as first_skill,
    skills[2] as second_skill,
    skills[3] as third_skill
from  skills_array;

-- Struct
SELECT {skill: 'python', type:'programing'} as skill_struct;

with skill_table AS (
    SELECT 'python' as skills, 'programing' as types
    UNION ALL 
    SELECT 'sql'  , 'query_language'
    UNION ALL 
    SELECT 'r'  , 'programing'
)
select
    struct_pack(
        skill := skills,
        type := types
    )
from skill_table;


-- Array of Structs
SELECT {skill: 'python', type:'programing'} as skill_struct;

with skill_table AS (
    SELECT 'python' as skills, 'programing' as types
    UNION ALL 
    SELECT 'sql'  , 'query_language'
    UNION ALL 
    SELECT 'r'  , 'programing'
), skills_array_struct as(
select
    ARRAY_AGG(
        struct_pack(
            skill := skills,
            type := types
        ))array_struct
from skill_table
)
select array_struct[2]
from skills_array_struct;


--
SELECT
FROM