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
