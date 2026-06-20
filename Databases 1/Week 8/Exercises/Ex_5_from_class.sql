Find the workers name and name of the city
they’re coming from, for those who work as
Accountant

select * from Employer where Profession='Accountant'
select id_City from Employer where Profession='Accountant'
--select * from Employer

select * from city
where id_city in (select id_City from Employer where Profession='Accountant')


select Employer.[name], city.[Name] from Employer, city
where Employer.id_city in (select id_City from Employer where Profession='Accountant') 
and  Employer.Profession='Accountant'

select Employer.[name], city.[Name] from Employer, city
where Employer.id_city=City.id_City 
and  Employer.Profession='Accountant'


where Employer.Profession='Accountant'
