docker exec -it new-api-postgres psql -U root -d new-api -c "
SELECT
  id,
  name,
  status,
  priority,
  weight,
  used_quota
FROM channels
WHERE type=54
  AND status=1
  AND \"group\"='default'
  AND models LIKE '%doubao-seedance-2-0-260128%'
ORDER BY id;
"



docker exec -it new-api-postgres psql -U root -d new-api -c "
SELECT
  COUNT(*) FILTER (WHERE status='SUCCESS') AS success_tasks,
  COALESCE(SUM((data->'usage'->>'total_tokens')::numeric) FILTER (WHERE status='SUCCESS'), 0) AS total_tokens,
  COALESCE(SUM((data->'usage'->>'completion_tokens')::numeric) FILTER (WHERE status='SUCCESS'), 0) AS completion_tokens
FROM tasks
WHERE platform='54';
"
