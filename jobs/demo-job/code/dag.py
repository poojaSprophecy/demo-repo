import os
import sys
import pendulum
from datetime import timedelta
import airflow
from airflow import DAG
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))
from en7vyilyx_mxoanynwwsaa_.tasks import DBT_0
PROPHECY_RELEASE_TAG = "__PROJECT_ID_PLACEHOLDER__/__PROJECT_RELEASE_VERSION_PLACEHOLDER__"

with DAG(
    dag_id = "En7vYilYX_MXOaNyNwwSAA_", 
    schedule_interval = "0 0/1 * * *", 
    default_args = {"owner" : "Prophecy", "ignore_first_depends_on_past" : True, "pool" : "2op_dB_W", "do_xcom_push" : True}, 
    start_date = pendulum.today('UTC'), 
    end_date = pendulum.datetime(2023, 7, 14, tz = "UTC"), 
    catchup = True
) as dag:
    DBT_0_op = DBT_0()
