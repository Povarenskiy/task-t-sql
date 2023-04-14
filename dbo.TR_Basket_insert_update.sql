if object_id('dbo.TR_Basket_insert_update', 'TR') is not null
  drop trigger dbo.TR_Basket_insert_update;
go

create trigger dbo.TR_Basket_insert_update on dbo.Basket
instead of insert
as
begin
  set nocount on;
  insert into dbo.Basket (ID_SKU, ID_Family, Quantity, Value, DiscountValue)
  select 
    ID_SKU
    ,ID_Family
    ,Quantity
    ,Value
    ,case 
	  when count(*) over (partition by ID_SKU) >= 2 then Value * 0.05
	  else 0
      end
  from inserted 
end
