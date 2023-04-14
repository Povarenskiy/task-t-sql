use test_db;


create table dbo.SKU (
  ID int not null identity primary key, 
  Code as 's' + cast(ID as varchar) unique, 
  Name varchar(255)
);


create table dbo.Family (
  ID int not null identity primary key,
  SurName varchar(255),
  BudgetValue money
);


create table dbo.Basket (
  ID int not null identity primary key,
  ID_SKU int not null references dbo.SKU(ID),
  ID_Family int not null references dbo.Family(ID),
  Quantity int check (Quantity >= 0),
  Value int check (Value >= 0),
  PurchaseDate date default getdate(),
  DiscountValue numeric(4, 3) check (DiscountValue between 0.000 and 1.000)
);
