create database VisaAndTour
go
create table Offices(
OfficesCode int primary key not null,
Adress varchar(100),
)

create table AvailableTours(
CodeTours int primary key not null,
Country varchar(30),
City varchar(20),
Hotel varchar(30),
AccessToTheSea varchar(3),
Price money,
Office int,
Foreign key (Office) references Offices(OfficesCode),
)

create table PartnerCompanies(
CompanyName varchar(30),
INN int primary key not null,
Country varchar(30),
City varchar(20),
Hotel varchar(30),
AccessToTheSea varchar(3),
Price money,
PriceWithASurcharge money,
Office int,
Foreign key (Office) references Offices(OfficesCode),
)

create table Clients(
CodeClient int primary key not null,
FirstName varchar(20),
LastName varchar(20),
Patronymic varchar(20),
DateOfBirth date,
PassportData varchar(10),
PhoneNumber varchar(12),
AvailabilityVisa varchar(3),
AvailabilityForeignPassport varchar(3),
Office int,
Foreign key (Office) references Offices(OfficesCode),
)

create table PurchasedTours(
CodeTours int primary key not null,
PhoneNumber varchar(12),
Country varchar(30),
City varchar(20),
Hotel varchar(30),
AccessToTheSea varchar(3),
Price money,
OnCreditOrNo varchar(3),
Office int,
Foreign key (Office) references Offices(OfficesCode),
)

create table Employees(
INNEmployee int primary key not null,
FirstName varchar(20),
LastName varchar(20),
Patronymic varchar(20),
PhoneNumber varchar(12),
JobTitle varchar(30),
Office int,
Foreign key (Office) references Offices(OfficesCode),
)
go
insert into Offices(OfficesCode,Adress)
values
 ('1','Pushkina 20')

insert into AvailableTours(CodeTours,Country,City,Hotel,AccessToTheSea,Price,Office) 
values 
 ('1','France','Paris','AIrowrhek','no','128000','1'), 
 ('2','UAE','Dubai','Auiosydsgu','yes','247000','1'), 
 ('3','Russia','Sochi','Iyioahln','yes','70000','1'), 
 ('4','Russia','Adler','JKADfg','yes','68000','1'), 
 ('5','Indonesia','Djacarta','DSfjsklf','yes','169000','1') 
 
insert into PartnerCompanies(CompanyName,INN,Country,City,Hotel,AccessToTheSea,Price,PriceWithASurcharge,Office) 
values 
 ('Albatros','379127867','Norway','Oslo','SDJKhgkaf','no','170000','195000','1'), 
 ('Apelsin','279127867','USA','California','ASjdhsjka','yes','300000','330000','1'), 
 ('Kakadu-tur','579127860','Canada','Toronto','Dsjfhjk','no','260000','284000','1'), 
 ('ANEXTour','779100867','Japan','Tokyo','ASjkldskla','no','190000','220000','1'), 
 ('PegasTuristik','979127812','Japan','Kanazawa','Asdhla','yes','156000','170000','1') 
 
insert into Clients(CodeClient,FirstName,LastName,Patronymic,DateOfBirth,PassportData,PhoneNumber,AvailabilityVisa,AvailabilityForeignPassport,Office) 
values 
 ('1','Антон', 'Караванов', 'Евгеньевич','15.12.2001','9545596631','+79127867678','yes','yes','1'), 
 ('2','Михаил', 'Боданов', 'Саныч','11.09.1978','9545596634','+79127867000','yes','yes','1'), 
 ('3','Панкрат', 'Панкратьев', 'Панкратович','15.03.1999','9545596636','+79127860678','yes','yes','1'), 
 ('4','Ибрагим', 'Михалчук', 'Данилович','01.04.1989','9545596639','+79100867678','no','yes','1'), 
 ('5','Михаил', 'Гордеев', 'Алексеевич','16.01.2003','9545596630','+79127812678','yes','yes','1') 
 
insert into PurchasedTours(CodeTours,PhoneNumber,Country,City,Hotel,AccessToTheSea,Price,OnCreditOrNo,Office) 
values 
 ('1','+79127867678','France','Paris','Nasjbcjk','no','133000','no','1'), 
 ('2','+79127867000','USA','California','ALsjd;kl','yes','300000','yes','1'), 
 ('3','+79127860678','Canada','Toronto','OIAsuiou','yes','260000','yes','1'), 
 ('4','+79100867678','Japan','Kyoto','SDfgas','no','156000','no','1'), 
 ('5','+79127812678','Japan','Kanazawa','Pasdjo','yes','190000','no','1') 

insert into Employees(INNEmployee,FirstName,LastName,Patronymic,PhoneNumber,JobTitle,Office) 
values 
 ('379127867','Сергей','Коренев','Владимирович','+79205988464','Директор','1'), 
 ('379567867','Данил','Минин','Андреевич','+79126874521','Зам.Директора','1'), 
 ('863127867','Денис','Панкратьев','Андреевич','+79126874521','МанагерПоТуризму','1'), 
 ('379127082','Александр','Оськин','Александрович','+79125886347','МанагерПоТуризму','1'), 
 ('379127873','Глеб','Неустроев','Дмитриевич','+79635896263','Уборщик','1')


--ЗАПРОСЫ
declare @CountryName varchar(30) = 'Russia' -- вывести по названию страны доступные в ней туры 
select [dbo].AvailableTours.Country as [Страна], 
[dbo].AvailableTours.City as [Город], 
[dbo].AvailableTours.Hotel as [Отель], 
[dbo].AvailableTours.AccessToTheSea as [Выход к морю],
[dbo].AvailableTours.Price as [Цена]
from [dbo].AvailableTours
where [dbo].AvailableTours.Country = @CountryName

declare @PartnerCountryName varchar(30) = 'Japan' -- вывести по названию страны доступные в ней туры (у партнеров)
select [dbo].PartnerCompanies.CompanyName as [Компания партнер],
[dbo].PartnerCompanies.Country as [Страна], 
[dbo].PartnerCompanies.City as [Город], 
[dbo].PartnerCompanies.Hotel as [Отель], 
[dbo].PartnerCompanies.AccessToTheSea as [Выход к морю],
[dbo].PartnerCompanies.Price as [Цена],
[dbo].PartnerCompanies.PriceWithASurcharge as [Цена с наценкой (для клиента)]
from [dbo].PartnerCompanies
where [dbo].PartnerCompanies.Country = @PartnerCountryName


declare @PhoneNumber varchar(12) = '+79127867678' --вывести по номеру телефона какой клиент купил какой тур
select [dbo].PurchasedTours.PhoneNumber as [Номер телефона], 
[dbo].Clients.FirstName as [Имя],  
[dbo].Clients.LastName as [Фамилия],
[dbo].Clients.Patronymic as [Отчество],
[dbo].PurchasedTours.Country as Страна, 
[dbo].PurchasedTours.City as [Город], 
[dbo].PurchasedTours.Hotel as [Отель], 
[dbo].PurchasedTours.Price as [Цена],
[dbo].PurchasedTours.OnCreditOrNo as [Кредитование]
from [dbo].Clients, [dbo].PurchasedTours 
where [dbo].PurchasedTours.PhoneNumber = @PhoneNumber and 
[dbo].PurchasedTours.PhoneNumber = [dbo].Clients.PhoneNumber 

create trigger DeleteAvailableTours
on AvailableTours 
for delete 
as 
print 'Попытка удаления данных' 
print 'Удаление запрещено' 
Rollback transaction 
 
create trigger DeleteOffice
on Offices 
for delete 
as 
print 'Попытка удаления данных' 
print 'Удаление продаж запрещенно' 
Rollback transaction 
 
create trigger UpdateTours
on AvailableTours 
for update 
as 
print 'Попытка изменения данных' + STR(@@ROWCOUNT) + ' Строк в таблице AvailableTours' 
if update (CodeTours) or update (Country) or update (Hotel) or update (AccessToTheSea) or update (Office)
begin  
print 'Изменения допустимы только в столбце price' 
Rollback transaction 
end 

create procedure addAvailableTours -- добавление тура 
@a int,  
@b varchar(30),  
@c varchar(20),  
@d varchar(30),
@e varchar(3),
@f money,
@g int
as 
begin 
insert into AvailableTours (CodeTours, Country, City, Hotel, AccessToTheSea, Price, Office) values (@a, @b, @c, @d,@e,@f,@g); 
end 
exec addAvailableTours '6','Гренландия','Нуук','Кострома123','да','96578','1'

Create procedure NoPhoneClients -- найти клиента без номера телефона
as 
Begin 
Select CodeClient, 
FirstName, 
LastName, 
Patronymic, 
DateOfBirth, 
PassportData, 
PhoneNumber, 
AvailabilityVisa, 
AvailabilityForeignPassport, 
Office  
from Clients 
Where PhoneNumber is null  
if @@ROWCOUNT=0 
Print 'Не найдено' 
End

Create login "admin" with password = '123'  
Create user adminUser for login "admin" -- создание админа, доступ ко всему 
 
Create login Director with password = 'director123' 
Create user DirectorUser for login Director -- создание директора, может только просматривать (директор и заместитель используют одного пользователя) 
 
Create login Manager1 with password = 'manager1' 
Create user Manager1User for login Manager1 --создание доступа для манагера, могут обновлять таблицу купленные туров, добавлять клиентов и изменять доступные туры

Create login Manager2 with password = 'manager2' 
Create user Manager2User for login Manager2 --создание доступа для манагера, могут обновлять таблицу купленные туров, добавлять клиентов и изменять доступные туры
 
 
Grant select on Offices to adminUser -- полный доступ админу 
Grant select on Offices to adminUser 
Grant delete on Offices to adminUser  
Grant update on Offices to adminUser 
Grant insert on AvailableTours to adminUser  
Grant select on AvailableTours to adminUser  
Grant delete on AvailableTours to adminUser  
Grant update on AvailableTours to adminUser 
Grant insert on PartnerCompanies to adminUser  
Grant select on PartnerCompanies to adminUser  
Grant delete on PartnerCompanies to adminUser  
Grant update on PartnerCompanies to adminUser 
Grant insert on Clients to adminUser  
Grant select on Clients to adminUser  
Grant delete on Clients to adminUser  
Grant update on Clients to adminUser
Grant insert on PurchasedTours to adminUser  
Grant select on PurchasedTours to adminUser  
Grant delete on PurchasedTours to adminUser  
Grant update on PurchasedTours to adminUser 
Grant insert on Employees to adminUser  
Grant select on Employees to adminUser  
Grant delete on Employees to adminUser  
Grant update on Employees to adminUser 
 
Grant select on Offices to DirectorUser --просмотр для директора 
Grant select on AvailableTours to DirectorUser 
Grant select on PartnerCompanies to DirectorUser 
Grant select on Clients to DirectorUser
Grant select on PurchasedTours to DirectorUser 
Grant select on PartnerCompanies to DirectorUser 
Grant select on Employees to DirectorUser
 
Grant update on AvailableTours to Manager1User --добавление и изменения для манагера1
Grant insert on AvailableTours to Manager1User 
Grant select on AvailableTours to Manager1User 
Grant update on Clients to Manager1User  
Grant insert on Clients to Manager1User 
Grant select on Clients to Manager1User
Grant update on PurchasedTours to Manager1User  
Grant insert on PurchasedTours to Manager1User 
Grant select on PurchasedTours to Manager1User

Grant update on AvailableTours to Manager2User --добавление и изменения для манагера2
Grant insert on AvailableTours to Manager2User 
Grant select on AvailableTours to Manager2User 
Grant update on Clients to Manager2User  
Grant insert on Clients to Manager2User 
Grant select on Clients to Manager2User
Grant update on PurchasedTours to Manager2User  
Grant insert on PurchasedTours to Manager2User 
Grant select on PurchasedTours to Manager2User