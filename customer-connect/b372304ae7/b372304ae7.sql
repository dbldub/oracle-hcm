SELECT wt.assignment_id wt_id,
       wt.assignment_number wt_num,
       asg.assignment_id asg_id,
       asg.assignment_number asg_num
FROM per_all_assignments_f wt,
     per_all_assignments_f asg
WHERE 1=1
  AND trunc(sysdate) BETWEEN wt.effective_start_date AND wt.effective_end_date
  AND trunc(sysdate) BETWEEN asg.effective_start_date AND asg.effective_end_date
  AND wt.assignment_id = asg.work_terms_assignment_id
  AND wt.work_terms_assignment_id IS NULL
  AND asg.person_id IN
    (SELECT person_id
     FROM per_people_x
     WHERE person_number = '<insert pnum here>')
