/*1 task
 * Вывести среднюю заработную плату всех тестировщиков на проекте “ПУМЧД”.
Ответ должен содержать столбцы:
 Название проекта; project_name
 Название должности; title_name.
 Средняя заработная плата. salary.
 */ 
/*
select pr.project_name, tl.title_name, avg (ps.salary) 
from positions ps 
join projects pr on ps.project_id=pr.project_id
join titles tl on ps.title_id=tl.id
where ps.title_id = 'a621280e-8725-427c-92aa-d7a2493d7cb9' 
and ps.project_id = '2432cbcb-f4a2-452a-945d-7e8bbf605f60'
group by pr.project_name, tl.title_name 
*/
/*
2) Вывести всех работников, которые работают сразу на нескольких проектах.
Ответ должен содержать следующие столбцы:
∙ Имя и фамилия сотрудника; 
∙ Название должности. 
*/
/*
select distinct e.first_name, e.last_name, t.title_name
from employee e
join positions p ON e.employee_id = p.employee_id
join titles t ON p.title_id = t.id
join projects pr ON p.project_id = pr.project_id
WHERE
  e.employee_id IN (
    SELECT employee_id
    FROM positions
    GROUP BY employee_id
    HAVING COUNT(DISTINCT project_id) > 1
  );
