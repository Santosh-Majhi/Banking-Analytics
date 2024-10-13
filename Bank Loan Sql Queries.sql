-- TOTAL LOAN APPLICATIONS:
select count(id) as Total_Applications from bank_loan_data;

-- MTD LOAN APPLICATIONS:
select count(id) as Total_Applications from bank_loan_data
where month(issue_date)=12;

-- PMTD LOAN APPLICATIONS:
select count(id) as Total_Applications from bank_loan_data
where month(issue_date)=11;

-- TOTAL FUNDED AMOUNT:
select sum(loan_amount) as Total_Funded_Amount from bank_loan_data;


-- MTD TOTAL FUNDED AMOUNT:
select sum(loan_amount) as Total_Funded_Amount from bank_loan_data
where month(issue_date)=12;

-- PMTD TOTAL FUNDED AMOUNT:
select sum(loan_amount) as Total_Funded_Amount from bank_loan_data
where month(issue_date)=11;

-- TOTAL AMOUNT RECEIVED:
select sum(total_payment) as Total_Amount_Collected from bank_loan_data;

-- MTD TOTAL AMOUNT RECEIVED:
select sum(total_payment) as Total_Amount_Collected from bank_loan_data
where month(issue_date)=12;

-- PMTD TOTAL AMOUNT COLLECTED:
select sum(total_payment) as Total_Amount_Collected from bank_loan_data
where month(issue_date)=11;

-- AVERAGE INTEREST RATE:
select avg(int_rate)*100 as Avg_Int_Rate from bank_loan_data;

-- MTD AVERAGE INTEREST:
select avg(int_rate)*100 as MTD_Avg_Int_Rate from bank_loan_data
where month(issue_date)=12;

-- PMTD AVERAGE INTEREST:
select avg(int_rate)*100 as PMTD_Avg_Int_Rate from bank_loan_data
where month(issue_date)=11;

-- AVERAGE DTI:
select avg(dti)*100 as Avg_DTI from bank_loan_data;

-- MTD AVERAGE DTI:
select avg(dti)*100 as MTD_Avg_DTI from bank_loan_data
where month(issue_date)=12;

-- PMTD AVERAGE DTI:
select avg(dti)*100 as PMTD_Avg_DTI from bank_loan_data
where month(issue_date)=11;



-- GOOD LOAN PERCENTAGE:
select (count(case when loan_status="Fully Paid" or loan_status="Current" then id end)*100.0)/count(id) 
as Good_Loan_Percentage from bank_loan_data;

-- GOOD LOAN APPLICATIONS:
select count(id) as Good_Loan_Applications from bank_loan_data
where loan_status="Fully paid" or loan_status="Current";

-- GOOD LOAN FUNDED AMOUNT:
select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data
where loan_status="Fully paid" or loan_status="Current";

-- GOOD LOAN AMOUNT RECEIVED:
select sum(total_payment) as Good_Loan_Amount_Received from bank_loan_data
where loan_status="Fully paid" or loan_status="Current";



-- BAD LOAN PERCENTAGE:
select (count(case when loan_status="Charged Off" then id end)*100.0)/count(id) 
as Bad_Loan_Percentage from bank_loan_data;

-- BAD LOAN APPLICATIONS:
select count(id) as Bad_Loan_Applications from bank_loan_data
where loan_status="Charged Off";

-- GAD LOAN FUNDED AMOUNT:
select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data
where loan_status="Charged Off";

-- BAD LOAN AMOUNT RECEIVED:
select sum(total_payment) as Bad_Loan_Amount_Received from bank_loan_data
where loan_status="Charged Off";



-- LOAN STATUS:
select loan_status, count(id) as Loan_Count,sum(total_payment) as Total_Aount_Received,
sum(loan_amount) as Total_Funded_Amount,avg(int_rate*100) as Interest_Rate,
avg(dti*100) as DTI from bank_loan_data
group by loan_status;

-- LOAN STATUS:
select loan_status,sum(total_payment) as MTD_Total_Amount_Received,
sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where month(issue_date)=12
group by loan_status;



-- MONTH:
select month(issue_date) as Month_Number,monthname(issue_date) as Month_Name,
count(id) as Total_Loan_Applications,sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received from bank_loan_data
group by Month_Number,Month_Name
order by Month_Number;


-- STATE:
select address_state as State,count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Amount_Received from bank_loan_data
group by State
order by State;


-- TERM:
select term as Term,count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received from bank_loan_data
group by Term;


-- EMPLOYEE LENGTH:
select emp_length as Employee_Length,count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,sum(total_payment) as Total_Amount_Received 
from bank_loan_data
group by Employee_Length
order by Employee_Length;


-- PURPOSE:
select purpose as Purpose,count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,sum(total_payment) as Total_Amount_Received 
from bank_loan_data
group by Purpose
order by Purpose;


-- HOME OWNERSHIP
select home_ownership as Home_Ownership,count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,sum(total_payment) as Total_Amount_Received 
from bank_loan_data
group by Home_Ownership
order by Home_Ownership;