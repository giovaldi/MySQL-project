#yg dikerjain di terminal
#yang dikerjakan di terminal create database employee buat bikin database baru
#copy materi w3 ke terminal/cmd agar mudah terus buka database di workbench biar bisa diapus-apus
use employee; #untuk memakai atau akses database/schema employee
select * from employees; #untuk menampilkan keseluruhan table
select first_name as "First Name", last_name as "Last Name" from employees; #menggunakan fungsi "select" untuk memilih column yang ingin diubah dengan "as" dari table employees
select distinct department_id from employees; #mencari unique dengan distinct awalnya coba pake unique department_id tp error
select * from employees order by first_name desc; #select * untuk semua data , "order by first_name desc" untuk mengurutkan dari huruf terbelakang namadepan dengan desc
select first_name,last_name,salary,salary*15 as PF from employees; #select namadepan,belakang,gaji,membuat column baru PF dengan menerima hasil 15*gaji
select employee_id,first_name,last_name,salary from employees order by salary asc; #logicnya mirip dengan nomor 3 tp menampilkan lebih banyak kolom
select sum(salary) as totalgaji from employees; #menggunakan sum untuk menjumlahkan salari dan dimasukkan column baru sebagai nama totalgaji
select max(salary) as maksimumgaji, min(salary) as minimumgaji from employees; #max min untuk mengetahui maksimum dan minimum gaji
select avg(salary) as ratagaji, count(*) as totalemployees from employees; #menampilkan rata2 gaji pake avg(salary)
select count(*) as totalpekerja from employees; #menampilkan jumlah pekerja dengan count(*) bintang karena mencakup seluruh isi tabel
select count(distinct job_id) as pekerjaan_tersedia from employees; #logicnya mirip yang nomor sebelumnya pake distinct krn nyari unique2 dari pekerjaannya trs di count
select upper(first_name) as namapertama_besar from employees; #awalnya nyoba fungsi2 python upper trs bisa, ilmu baru 
select substring(first_name,1,3) as tiga_karakterpertama from employees; #ilmu baru substring(string,posisi,jumlah)
select 171*214+625 result; 
select first_name,last_name from employees where first_name like "%el"; #nyoba nangkep nama menggunakan "%el" buat nangkep nama akhiran el
select trim(first_name) as potongnama from employees; #ilmu baru
select length(first_name)+length(last_name) as panjangnama from employees; #ilmu baru
select * from employees where first_name regexp "[0-9]"; #ilmu baru
select * from employees limit 10; #pake limit buat nampilin 10 teratas data
select round(salary/12,2) as annualper12_bulanan from employees; #salary bulanan maka dibagi 12 terus di rata2

select count(distinct job_id) as totalpekerjaan from employees; #Write a query to list the number of jobs available in the employees table.
select sum(salary) as totalgaji from employees; #Write a query to list the number of jobs available in the employees table.
select min(salary) as upahminimum from employees; #Write a query to get the minimum salary from employees table
select max(max_salary) as upahmaksimum from employee.jobs where job_title="programmer"; #Write a query to get the maximum salary of an employee working as a Programmer.
select avg(salary) as rataratagaji90,count(*) as totalkaryawandep90 from employees where department_id=90; #Write a query to get the average salary and number of employees working the department 90.
select max(salary) as maxgaji,min(salary) as mingaji,sum(salary) as totalgaji, avg(salary) ratagaji from employees; #Write a query to get the highest, lowest, sum, and average salary of all employees
select job_id as pekerjaan, count(job_id) as totalpekerjaan from employees group by job_id; #Write a query to get the number of employees with the same job
select max(salary),min(salary),max(salary)-min(salary) as selisihgaji from employees; #Write a query to get the difference between the highest and lowest salaries
select manager_id as idmanager,min(salary) mingaji from employees where manager_id is not null group by manager_id order by min(salary); #Write a query to find the manager ID and the salary of the lowest-paid employee for that manager
select department_id,sum(salary) as totalgaji from employees group by department_id; #Write a query to get the department ID and the total salary payable in each department
select avg(salary) as ratagajiselainprog,job_id from employees where job_id != "it_prog" group by job_id; #Write a query to get the average salary for each job ID excluding programmer
SELECT job_id, sum(salary) as totalgajidep90, avg(salary) as ratagajidep90, max(salary) as maxgajidep90, min(salary) as mingajidep90 from employees where department_id = '90' group by job_id; #Write a query to get the total salary, maximum,minimum,average salary of employees (job ID wise), for department ID 90 only
select job_id, max(salary) from employees group by job_id having max(salary) >= 4000; #Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to 4000
select avg(salary),department_id, count(*) as lebihdari10 from employees group by department_id having count(department_id)> 10; #Write a query to get the average salary for all departments employing more than 10 employees