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
 ('1','�����', '���������', '����������','15.12.2001','9545596631','+79127867678','yes','yes','1'), 
 ('2','������', '�������', '�����','11.09.1978','9545596634','+79127867000','yes','yes','1'), 
 ('3','�������', '����������', '�����������','15.03.1999','9545596636','+79127860678','yes','yes','1'), 
 ('4','�������', '��������', '���������','01.04.1989','9545596639','+79100867678','no','yes','1'), 
 ('5','������', '�������', '����������','16.01.2003','9545596630','+79127812678','yes','yes','1') 
 
insert into PurchasedTours(CodeTours,PhoneNumber,Country,City,Hotel,AccessToTheSea,Price,OnCreditOrNo,Office) 
values 
 ('1','+79127867678','France','Paris','Nasjbcjk','no','133000','no','1'), 
 ('2','+79127867000','USA','California','ALsjd;kl','yes','300000','yes','1'), 
 ('3','+79127860678','Canada','Toronto','OIAsuiou','yes','260000','yes','1'), 
 ('4','+79100867678','Japan','Kyoto','SDfgas','no','156000','no','1'), 
 ('5','+79127812678','Japan','Kanazawa','Pasdjo','yes','190000','no','1') 

insert into Employees(INNEmployee,FirstName,LastName,Patronymic,PhoneNumber,JobTitle,Office) 
values 
 ('379127867','������','�������','������������','+79205988464','��������','1'), 
 ('379567867','�����','�����','���������','+79126874521','���.���������','1'), 
 ('863127867','�����','����������','���������','+79126874521','����������������','1'), 
 ('379127082','���������','������','�������������','+79125886347','����������������','1'), 
 ('379127873','����','���������','����������','+79635896263','�������','1')


--�������
declare @CountryName varchar(30) = 'Russia' -- ������� �� �������� ������ ��������� � ��� ���� 
select [dbo].AvailableTours.Country as [������], 
[dbo].AvailableTours.City as [�����], 
[dbo].AvailableTours.Hotel as [�����], 
[dbo].AvailableTours.AccessToTheSea as [����� � ����],
[dbo].AvailableTours.Price as [����]
from [dbo].AvailableTours
where [dbo].AvailableTours.Country = @CountryName

declare @PartnerCountryName varchar(30) = 'Japan' -- ������� �� �������� ������ ��������� � ��� ���� (� ���������)
select [dbo].PartnerCompanies.CompanyName as [�������� �������],
[dbo].PartnerCompanies.Country as [������], 
[dbo].PartnerCompanies.City as [�����], 
[dbo].PartnerCompanies.Hotel as [�����], 
[dbo].PartnerCompanies.AccessToTheSea as [����� � ����],
[dbo].PartnerCompanies.Price as [����],
[dbo].PartnerCompanies.PriceWithASurcharge as [���� � �������� (��� �������)]
from [dbo].PartnerCompanies
where [dbo].PartnerCompanies.Country = @PartnerCountryName


declare @PhoneNumber varchar(12) = '+79127867678' --������� �� ������ �������� ����� ������ ����� ����� ���
select [dbo].PurchasedTours.PhoneNumber as [����� ��������], 
[dbo].Clients.FirstName as [���],  
[dbo].Clients.LastName as [�������],
[dbo].Clients.Patronymic as [��������],
[dbo].PurchasedTours.Country as ������, 
[dbo].PurchasedTours.City as [�����], 
[dbo].PurchasedTours.Hotel as [�����], 
[dbo].PurchasedTours.Price as [����],
[dbo].PurchasedTours.OnCreditOrNo as [������������]
from [dbo].Clients, [dbo].PurchasedTours 
where [dbo].PurchasedTours.PhoneNumber = @PhoneNumber and 
[dbo].PurchasedTours.PhoneNumber = [dbo].Clients.PhoneNumber 

create trigger DeleteAvailableTours
on AvailableTours 
for delete 
as 
print '������� �������� ������' 
print '�������� ���������' 
Rollback transaction 
 
create trigger DeleteOffice
on Offices 
for delete 
as 
print '������� �������� ������' 
print '�������� ������ ����������' 
Rollback transaction 
 
create trigger UpdateTours
on AvailableTours 
for update 
as 
print '������� ��������� ������' + STR(@@ROWCOUNT) + ' ����� � ������� AvailableTours' 
if update (CodeTours) or update (Country) or update (Hotel) or update (AccessToTheSea) or update (Office)
begin  
print '��������� ��������� ������ � ������� price' 
Rollback transaction 
end 

create procedure addAvailableTours -- ���������� ���� 
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
exec addAvailableTours '6','����������','����','��������123','��','96578','1'

Create procedure NoPhoneClients -- ����� ������� ��� ������ ��������
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
Print '�� �������' 
End

Create login "admin" with password = '123'  
Create user adminUser for login "admin" -- �������� ������, ������ �� ����� 
 
Create login Director with password = 'director123' 
Create user DirectorUser for login Director -- �������� ���������, ����� ������ ������������� (�������� � ����������� ���������� ������ ������������) 
 
Create login Manager1 with password = 'manager1' 
Create user Manager1User for login Manager1 --�������� ������� ��� ��������, ����� ��������� ������� ��������� �����, ��������� �������� � �������� ��������� ����

Create login Manager2 with password = 'manager2' 
Create user Manager2User for login Manager2 --�������� ������� ��� ��������, ����� ��������� ������� ��������� �����, ��������� �������� � �������� ��������� ����
 
 
Grant select on Offices to adminUser -- ������ ������ ������ 
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
 
Grant select on Offices to DirectorUser --�������� ��� ��������� 
Grant select on AvailableTours to DirectorUser 
Grant select on PartnerCompanies to DirectorUser 
Grant select on Clients to DirectorUser
Grant select on PurchasedTours to DirectorUser 
Grant select on PartnerCompanies to DirectorUser 
Grant select on Employees to DirectorUser
 
Grant update on AvailableTours to Manager1User --���������� � ��������� ��� ��������1
Grant insert on AvailableTours to Manager1User 
Grant select on AvailableTours to Manager1User 
Grant update on Clients to Manager1User  
Grant insert on Clients to Manager1User 
Grant select on Clients to Manager1User
Grant update on PurchasedTours to Manager1User  
Grant insert on PurchasedTours to Manager1User 
Grant select on PurchasedTours to Manager1User

Grant update on AvailableTours to Manager2User --���������� � ��������� ��� ��������2
Grant insert on AvailableTours to Manager2User 
Grant select on AvailableTours to Manager2User 
Grant update on Clients to Manager2User  
Grant insert on Clients to Manager2User 
Grant select on Clients to Manager2User
Grant update on PurchasedTours to Manager2User  
Grant insert on PurchasedTours to Manager2User 
Grant select on PurchasedTours to Manager2User