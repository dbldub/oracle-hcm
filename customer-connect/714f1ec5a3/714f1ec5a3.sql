SELECT
     TO_CHAR(ppf.person_number) person_number,
     TO_CHAR(ppf.effective_start_date,'YYYY-MM-DD') person_eff,
     pea.email_address   email_address
 FROM
     per_all_people_f ppf,
     per_email_addresses pea
 WHERE
     1 = 1
     AND ( trunc(SYSDATE) BETWEEN ppf.effective_start_date AND ppf.effective_end_date
           OR ( trunc(SYSDATE) < ppf.effective_start_date ) )
     AND ppf.person_id = pea.person_id (+)
     AND ( trunc(SYSDATE) BETWEEN pea.date_from (+) AND nvl(pea.date_to(+),SYSDATE)
           OR ( trunc(SYSDATE) < pea.date_from (+) ) )
     AND pea.email_type (+) = 'W1'
     AND EXISTS (
         SELECT
             1
         FROM
             per_all_assignments_f paf
         WHERE
             1 = 1
             AND ppf.person_id = paf.person_id
             AND paf.primary_flag = 'Y'
             AND paf.primary_assignment_flag = 'Y'
             AND paf.assignment_status_type = 'ACTIVE'
             AND ( trunc(SYSDATE) BETWEEN paf.effective_start_date AND paf.effective_end_date
                   OR ( trunc(SYSDATE) < paf.effective_start_date ) )
     )
 ORDER BY
     ppf.person_number ASC,
     ppf.effective_start_date DESC
