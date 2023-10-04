{{
  config({    
    "materialized": "materialized_view"
  })
}}

WITH new_model AS (

  SELECT * 
  
  FROM {{ ref('new_model')}}

),

customer AS (

  SELECT * 
  
  FROM {{ source('samples.tpch', 'customer') }}

),

by_c_custkey_c_name AS (

  SELECT 
    new_model.n_nationkey AS n_nationkey,
    new_model.n_name AS n_name,
    new_model.n_regionkey AS n_regionkey,
    new_model.n_comment AS n_comment,
    customer.c_address AS c_address,
    customer.c_phone AS c_phone,
    customer.c_name AS c_name,
    customer.c_comment AS c_comment,
    customer.c_nationkey AS c_nationkey,
    customer.c_mktsegment AS c_mktsegment,
    customer.c_custkey AS c_custkey,
    customer.c_acctbal AS c_acctbal
  
  FROM customer
  INNER JOIN new_model
     ON customer.c_custkey = new_model.c_custkey
    AND customer.c_name = new_model.c_name
    AND customer.c_address = new_model.c_address
    AND customer.c_nationkey = new_model.c_nationkey
    AND customer.c_phone = new_model.c_phone
    AND customer.c_acctbal = new_model.c_acctbal
    AND customer.c_mktsegment = new_model.c_mktsegment
    AND customer.c_comment = new_model.c_comment

),

Macro_1 AS (

  {{()}}

)

SELECT *

FROM by_c_custkey_c_name
