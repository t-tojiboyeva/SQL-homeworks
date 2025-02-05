--Default
--Hometask
--Whenever a user enters blank ('', '  ') or null to F(address) it should automatically change it to Tashkent

create table F(fullname text, address text default 'Tashkent')

insert into F values ('Park Ji Sung', 'Seoul')
insert into F values ('Harry Wayne', 'Manchester')
insert into F values ('Lisandro Martinez', '')
insert into F(fullname) values ('Odil Axmedov')

insert into F values ('Andre Berchiche', null)

select * from F

 go
create trigger SetDefaultAddress
on F
instead of insert
 as
begin
 insert into F (fullname, address)
     select
        fullname, 
        case 
           when trim(address) = '' or address is null then  'Tashkent' 
             else address
        end
    from inserted;
end 
go
