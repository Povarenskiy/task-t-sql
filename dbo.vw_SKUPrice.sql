if object_id('dbo.vw_SKUPrice') is not null
  drop view dbo.vw_SKUPrice;
go

create view dbo.vw_SKUPrice
as
  select *, dbo.udf_GetSKUPrice(ID) as price
  from dbo.SKU
