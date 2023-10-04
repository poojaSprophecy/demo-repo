{{
  config({    
    "materialized": "materialized_view"
  })
}}

WITH nation AS (

  SELECT * 
  
  FROM {{ source('samples.tpch', 'nation') }}

),

customer AS (

  SELECT * 
  
  FROM {{ source('samples.tpch', 'customer') }}

),

customer_nation AS (

  SELECT * 
  
  FROM customer
  INNER JOIN nation
     ON customer.c_nationkey = nation.n_nationkey

)

SELECT *

FROM customer_nation
