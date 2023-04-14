if object_id('dbo.usp_MakeFamilyPurchase', 'P') is not null
  drop proc dbo.usp_MakeFamilyPurchase;
go

create proc dbo.usp_MakeFamilyPurchase
  @FamilySurName varchar(255)
as
  set nocount on;
  if exists (
    select ID
    from dbo.Family
    where SurName = @FamilySurName
    )
  begin
    update dbo.Family
      set BudgetValue = BudgetValue - (
	    select 
	      coalesce(sum(dbo.Basket.Value), 0)
	    from dbo.Basket
	    where dbo.Basket.ID_Family = dbo.Family.ID)
	  where SurName = @FamilySurName
  end 
  else
    print 'Error, there is no such family'
go


