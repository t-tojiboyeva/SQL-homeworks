-- Create the table
 create table #StrTest (PaymentDetails  varchar(max))

 insert into #StrTest  values
('Full Name = Abdullayev Shoxruh Account = 20201123456789790001 CorrAccount = 105USD777132005'),
('Full Name = Alimboev Hamid Account = 20001123459872543510 CorrAccount = 110USD000177007');

select * from  #StrTest;

 select
    PaymentDetails, 
    substring(PaymentDetails,  datalength('Full Name = ') + 1, 
         charindex('Account', PaymentDetails) - datalength('Full Name = ') - 2)  as FullName,
    
    substring(PaymentDetails, charindex('Account = ', PaymentDetails) + datalength('Account = '), 
        charindex('CorrAccount', PaymentDetails) - (charindex('Account = ', PaymentDetails) + datalength('Account = ')) - 1) as Account,

    substring(PaymentDetails, charindex('CorrAccount = ', PaymentDetails) + datalength('CorrAccount = '), 
       datalength(PaymentDetails) - (charindex('CorrAccount = ', PaymentDetails) + datalength('CorrAccount = ')) + 1) as CorrAccount  
 from #StrTest
