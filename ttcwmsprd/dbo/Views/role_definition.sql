create view dbo.role_definition as 
select distinct coalesce(role_id, task_id) as role_id 
   from task_definition 
union
select distinct role_id as role_id 
   from job_definition 
     where role_id is not null