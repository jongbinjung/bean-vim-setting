if !exists("b:ale_sql_sqlfluff_options")
  let b:ale_sql_sqlfluff_options=""
endif

let b:ale_sql_sqlfluff_options.=" --dialect snowflake"
