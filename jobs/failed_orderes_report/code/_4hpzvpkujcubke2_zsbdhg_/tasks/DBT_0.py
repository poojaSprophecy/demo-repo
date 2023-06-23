def DBT_0():
    settings = {}
    from datetime import timedelta
    from airflow.operators.bash import BashOperator
    envs = {}
    envs["DBT_PROFILE_SECRET"] = "3yz9Z33Y6NRdI9BHib6IR"
    envs["GIT_TOKEN_SECRET"] = ""
    envs["GIT_ENTITY"] = "branch"
    envs["GIT_ENTITY_VALUE"] = "dev-snowflake"
    envs["GIT_SSH_URL"] = "https://github.com/poojaSprophecy/demo-repo"
    envs["GIT_SUB_PATH"] = ""

    return BashOperator(
        task_id = "DBT_0",
        bash_command = f"$PROPHECY_HOME/run_dbt.sh \"dbt run --profile run_profile; dbt test --profile run_profile; \"",
        env = envs,
        append_env = True,
        **settings
    )
