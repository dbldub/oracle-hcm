SELECT ppx.person_number,
       min(pasf.effective_start_date)
FROM per_people_x ppx ,
     per_assignment_supervisors_f pasf
WHERE pasf.manager_id = ppx.person_id
  AND manager_type = 'LINE_MANAGER'
  AND ppx.person_number = '123'
GROUP BY ppx.person_number
ORDER BY 2 DESC
