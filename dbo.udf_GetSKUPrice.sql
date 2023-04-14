if object_id('dbo.udf_GetSKUPrice') is not null
  drop function dbo.udf_GetSKUPrice;
go

create function dbo.udf_GetSKUPrice (@ID_SKU int)
returns decimal(18, 2)
as
  begin
    return (
	  select cast(sum(Value) as decimal(18, 2)) / sum(Quantity) 
	  from dbo.Basket 
	  where ID_SKU = @ID_SKU
	  )
  end;
