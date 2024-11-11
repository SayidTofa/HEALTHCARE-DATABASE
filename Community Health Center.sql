CREATE DATABASE community_health;
USE community_health;
CREATE TABLE employee_info (Employee_info_id int auto_increment key,
	Designation VARCHAR(30),
	Salary DECIMAL(10,2),
	Employment_Date Date,
	Position VARCHAR(50));
    
    insert into employee_info (designation, salary, employment_date, position)
values('lab technician', 180000,'2022-03-14','senior'),
    ('surgeon', 3000000,'2022-04-11','senior'),
    ('dentist', 200000,'2019-07-21','junior'),
    ('general practitoner', 500000,'2014-09-20','consultant'),
    ('security', 50000,'2017-11-14','gateman'),
    ('accountant', 400000,'2016-03-14','mid career'),
	('Nurse', 400000,'2014-03-14','matron'),
	('pharmacicst', 300000,'2011-06-14','senior'),
	('janitor', 80000,'2020-7-14','contractor'),
	('psychiatrist', 500000,'2011-9-14','senior');
    
    select * from employee_info;
    
    
    CREATE TABLE employees (employee_id int auto_increment primary key,
	First_Name VARCHAR(25),	
	Last_name VARCHAR(25),
	Address VARCHAR(100),
	Phone_Number VARCHAR(20),
	Gender varchar(6),
	DOB DATE,
	employee_info_id int, foreign key (employee_info_id) references employee_info (employee_info_id));
    
    select * from employees;
    
    DELIMITER //
   create procedure find_employee(in f_name varchar(50),
									in l_name varchar(50))
   begin
    select * from employees
    where first_name = f_name and last_name = l_name;
    END //
    DELIMITER ;    
    CALL find_employee();
    
    
    CREATE TABLE patient_info (Patient_Info_Id INT auto_increment primary key,
	Patient_case VARCHAR(50),
	Department VARCHAR(50),
    Patient_Rcord text);
    
        insert into patient_info (patient_case, department, patient_rcord)
values ('malaria','general practitioner','3 times'),
('heart issue','cardiologist','7 times'),    
('teeth arch','dentis5','3 times'),    
('respiratory problem','pulmonologist','4 times'),    
('skin issue','dermatologist','9 times'),    
('eyes issue','ophthalmologist','3 times'),    
('bones issue','orthopedic','8 times'),    
('mental health','psychologist','2 times'),    
('kidney','urologist','3 times');
    
    select * from patient_info;
    
    
    CREATE TABLE drugs (Drugs_Id INT auto_increment primary key,
	Drug_Name VARCHAR(200),
	Prescription VARCHAR(100),
	Expiry_Date DATE,
	Purchase_Price DECIMAL(10,2));
    
    insert into drugs (drug_name, prescription, expiry_date, Purchase_Price)
values ('Amoxicillin','8 daily','2020-04-12','11'),
 ('Azithromycin','4 daily','2021-03-15','12'),
 ('Ciprofloxacin','2 daily','2002-05-14','6'),
 ('Doxycycline','6 daily','2005-01-12','9'),
 ('Penicillin','3 daily','2024-04-12','7'),
 ('parado','5 daily','2022-04-12','8'),
 ('paracetamor','1 daily','2008-04-12','5'),
 ('Gaska','9 daily','2019-07-19','15'),
  ('Zeal','7 daily','2009-09-11','20');
    
    select * from drugs;
    
     DELIMITER //
   create procedure drug_name(in drugs varchar(50))
   begin
    select * from drugs
    where drug_name=drug_name;
    END //
    DELIMITER ;    
    CALL find_drugs("parado");
    
    
      CREATE TABLE Patients (Patient_Id INT auto_increment primary key,
	First_name varchar (25), Last_name varchar (25), Address varchar (100), Phone_number varchar (20),
    Gender varchar (6), DOB date, 
    Patient_Info_Id int,
    foreign key (Patient_Info_Id) references patient_info (Patient_Info_Id));

    DELIMITER //
CREATE PROCEDURE patient_data()
BEGIN
SELECT * FROM patients;
END //
DELIMITER ;

CALL patient_data();
    
    
CREATE TABLE payment (Payment_Id INT auto_increment key,
	Payment_Type VARCHAR(50),
	Amount DECIMAL(10,2),
	Patient_Id INT, foreign key (Patient_Id) references patients (Patient_Id),
    Payment_Mode VARCHAR(50));
    
  insert into payment (payment_Type, Amount, patient_Id, Payment_Mode)
  values ('Medical savings','300.00','1','Cash payment'),
  ('Health insurance','500.56','2','Cheque payment'),
  ('Drugs payment','200.65','3','card payment'),
  ('surgical payment','700.76','4','Bank transfer payment'),
  ('pharmaceutical','900.45','5','Pos payment'),
  ('Accident payment','400.23','6','Credit card payment'),
  ('Blood test','100.33','7','card payment'),
  ('Genotype test','600.67','8','Electronic transfer payment'),
  ('Consultation payment','100.87','9','Cypto payment');
  
    select * from payment;
    
    
    CREATE TABLE Ward (ward_id int auto_increment primary key,
    ward_type varchar(50));
    CREATE TABLE Equipment (Equipment_Id INT auto_increment primary key,	
	Equipment_type varchar(100),
	Equipment_Status VARCHAR(50));
    
     insert into ward (ward_type)
  values ('medical wards'),
  ('Surgical wards'),
  ('Pediatric wards'),
  ('Intensive care unit wards'),
  ('Maternity wards'),
  ('Psychiatric wards'),
  ('Orthoepedic wards'),
  ('Geriatric wards'),
  ('Cardiac wards');
  
    
    select * from ward;
    
    
    CREATE TABLE Consultation (Consultation_Id INT auto_increment primary key,
	Employee_id int, foreign key (employee_id) references employees (employee_id),
    Patient_id int, foreign key (patient_id) references patients (patient_id),
    Drugs_id int, foreign key (drugs_id) references drugs (drugs_id),
    Complaint text,
    Test text,
    Diagonsis text,
    Consultation_date date);
    
      insert into consultation (Complaint, Test, Diagonsis, Consultation_date)
  values ('Fever','Blood test','Clinical diagonsis','2021-04-15'),
  ('Chest pain','Xray','Heart failure','2022-07-12'),
  ('stormach pain','blood test','Ulcer','2001-09-13'),
  ('Head arch','Ultrasounds test','Brain tumor','2024-01-02'),
  ('Body weakness','Urine test','Typhoid','2025-04-03'),
  ('Waist pain','Xray','Romanticism','2004-07-08'),
  ('Eyes short sight',' Eye test','Cataract','2007-04-04'),
  ('Bone fraction','Xray','Bone cancer','2024-02-07'),
  ('Dizziness','blood test','Blood cancer','2021-04-15');
    
    select * from Consultation;
    
    
     
  
   select * from consultation;
   select * from employees;
   select employees.first_name,employees.last_name, employees.address, 
   employees.gender, employee_info.designation, 
   employee_info.salary, employee_info.position from employees join employee_info on 
   employees.employee_info_id = employee_info.employee_info_id;
   

   
     select * from patient_info;
     select * from patients;
     select patients.first_name, patients.last_name, 
     patients.address, patients.gender, 
     patient_info.patient_case, 
     patient_info.department, 
     patient_info.patient_rcord 
     from patients join patient_info on 
     patients.patient_info_id = 
     patient_info.patient_info_id;
     
     select employees.First_Name as "Employee's first_name", 
     employees.Last_name as "employee's surname", 
     patients.First_name as "patient's first_name", 
     patients.Last_name as "patient's surname", 
     consultation.Complaint, consultation.Diagonsis, 
     consultation.test, drugs.Drug_Name, drugs.Prescription, 
     drugs.Purchase_Price from consultation join 
     employees on employees.employee_id =
     consultation.Employee_id join patients on patients.Patient_Id =
     consultation.Patient_id join 
     drugs on drugs.Drugs_Id = consultation.Drugs_id;
     
      select employees.First_Name as "Employee's first_name", 
     employees.Last_name as "employee's surname", 
     patients.First_name as "patient's first_name", 
     patients.Last_name as "patient's surname", 
     payment.payment_type, payment.amount, 
     payment.payment_mode from payment join 
     employees on employees.employee_id =
     payment.Employee_id join patients on patients.Patient_Id =
     payment.Patient_id;
     
     CREATE VIEW Emp_Info as select employees.First_Name, employees.Last_name,
     employees.address, employees.gender, employee_info.designation,
     employee_info.salary,
     employee_info.position from employees join 
     employee_info on employees.employee_info_id = 
     employee_info.employee_info_id;
     select * from emp_info;
     
  create view consultation as select employees.First_Name as "Employee's first_name", 
     employees.Last_name as "employee's surname", 
     patients.First_name as "patient's first_name", 
     patients.Last_name as "patient's surname", 
     consultation.Complaint, consultation.Diagonsis, 
     consultation.test, drugs.Drug_Name, drugs.Prescription, 
     drugs.Purchase_Price from consultation join 
     employees on employees.employee_id =
     consultation.Employee_id join patients on patients.Patient_Id =
     consultation.Patient_id join 
     drugs on drugs.Drugs_Id = consultation.Drugs_id;
     
     select * from consultation;
     
     select Avg (salary) Average_salary from employee_info;
     select count(first_name) number_of_employees from employees;
     select designation, sum(salary * 4) annual_earning from employee_info
     group by Designation order by annual_earning;
     
     select Avg (salary) Average_salary from employee_info;
     select count(first_name) number_of_employees from employees;
     select designation, sum(salary * 4) quater_earning from employee_info
     group by Designation order by quater_earning;
     
	
     select count(payment_type) payments from payment_type;
     select payment_type, sum(amount * 24) two_years_payment from payment
     group by payment_type order by two_years_payment;
     
     
     select designation, sum(salary) as "total salary"
     from employee_info group by Designation order by sum(salary); 
    
     select designation, max(salary) salary_earned from employee_info group by 
     Designation order by Salary_earned asc;
      select designation, min(salary) salary_earned from employee_info group by 
     Designation order by Salary_earned desc;
     
	
     
     
     
     
     
     
     
     
  

  
  
       
    