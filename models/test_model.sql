{{
  config({    
    "materialized": "materialized_view"
  })
}}

WITH customer AS (

  SELECT * 
  
  FROM {{ source('samples.tpch', 'customer') }}

),

nation AS (

  SELECT * 
  
  FROM {{ source('samples.tpch', 'nation') }}

),

Join_1 AS (

  SELECT * 
  
  FROM customer AS in0
  INNER JOIN nation AS in1
     ON in0.c_nationkey = in1.n_nationkey

)

SELECT *

FROM Join_1
