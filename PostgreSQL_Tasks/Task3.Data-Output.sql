/*1 task
 * Вывести среднюю заработную плату всех тестировщиков на проекте “ПУМЧД”.
Ответ должен содержать столбцы:
 Название проекта; project_name
 Название должности; title_name.
 Средняя заработная плата. salary.
 */ 

select pr.project_name, tl.title_name, round (avg (ps.salary))
from positions ps 
join projects pr on ps.project_id=pr.project_id
join titles tl on ps.title_id=tl.id
where tl.title_name = 'QA' 
and pr.project_name = 'ПУМЧД'
group by pr.project_name, tl.title_name;

/*
2) Вывести всех работников, которые работают сразу на нескольких проектах.
Ответ должен содержать следующие столбцы:
∙ Имя и фамилия сотрудника; 
∙ Название должности. 
*/

select distinct  e.first_name || ' ' || e.last_name as full_name, t.title_name
from employee e
join positions p ON e.employee_id = p.employee_id
join titles t ON p.title_id = t.id
group by e.first_name, e.last_name, t.title_name
HAVING COUNT(distinct project_id) > 1;

