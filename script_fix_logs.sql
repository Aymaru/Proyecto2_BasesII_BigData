use Campaign

alter table dbo.CDB_Logs
add action_section nvarchar(32);

update dbo.CDB_Logs 
set action_section = g1.name
from	dbo.CDB_ActionsInfo ai inner join
		dbo.CDB_Generics g1 on (ai.idAction = g1.idGeneric) inner join
		dbo.CDB_ActionsXSection axs on (ai.idAction = axs.idActionSection) inner join
		dbo.CDB_Generics g2 on (axs.idAction = g2.idGeneric) 
where	CDB_Logs.action_type = g2.name
